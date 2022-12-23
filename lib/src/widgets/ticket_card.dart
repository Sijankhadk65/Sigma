import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/bloc/worker_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/worker.dart';
import 'package:sigma_app/src/screen/ticket_detail_screen.dart';

class TicketCard extends StatefulWidget {
  const TicketCard({
    Key? key,
    required this.ticket,
    required this.sn,
    required this.ticketBloc,
  }) : super(key: key);

  final Ticket? ticket;
  final TicketBloc? ticketBloc;
  final int sn;

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard>
    with AutomaticKeepAliveClientMixin {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                Provider(
                  create: (context) => TicketBloc(),
                ),
                Provider(
                  create: (context) => WorkerBloc(),
                ),
                Provider(
                  create: (context) => InventoryBloc(),
                ),
              ],
              child: TicketDetailScreen(
                ticketID: widget.ticket!.id,
                workerID: widget.ticket!.serviced_by,
              ),
            ),
          ),
        );
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Checkbox(
                  value: _isSelected,
                  onChanged: (value) {
                    if (_isSelected) {
                      widget.ticketBloc!.unparkTicket(widget.ticket!);
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    } else {
                      if (widget.ticketBloc!.parkedTicketsList.isNotEmpty) {
                        if (widget.ticketBloc!.parkedTicketsList[0]
                                .is_payment_due !=
                            widget.ticket!.is_payment_due) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Select tickets of the same type"),
                            ),
                          );
                          return;
                        }
                      }
                      widget.ticketBloc!.parkTicket(widget.ticket!);
                      setState(() {
                        _isSelected = !_isSelected;
                      });
                    }
                    // _changeSelection();
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "${widget.sn}",
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  widget.ticket!.device_manufacturer!,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  widget.ticket!.device_model!,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 5,
                child: StreamBuilder<Customer?>(
                  stream: widget.ticketBloc!
                      .getTicketCustomer(widget.ticket!.customer_id!),
                  builder: (context, customerSnapshot) {
                    if (customerSnapshot.hasError) {
                      return Text("${customerSnapshot.error}");
                    }
                    switch (customerSnapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text("Awaiting Bids....");
                      case ConnectionState.waiting:
                        return const Text("Waiting....");
                      case ConnectionState.active:
                        return const Text("Connection is Active");
                      case ConnectionState.done:
                        return customerSnapshot.hasData
                            ? Column(
                                children: [
                                  Text(
                                    customerSnapshot.data!.name,
                                  ),
                                  Text(
                                    customerSnapshot.data!.address,
                                  ),
                                ],
                              )
                            : const Text("N/A");
                    }
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Text("Open Issuse: ${widget.ticket!.open_issue}"),
                    Text("Closed Issuse: ${widget.ticket!.closed_issue}"),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: widget.ticket!.serviced_by == null
                    ? Text(
                        "N/A",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(),
                      )
                    : StreamBuilder<Worker?>(
                        stream: widget.ticketBloc!
                            .getTicketWorker(widget.ticket!.serviced_by!),
                        builder: (context, workerSnapshot) {
                          if (workerSnapshot.hasError) {
                            return Text("${workerSnapshot.error}");
                          }
                          switch (workerSnapshot.connectionState) {
                            case ConnectionState.none:
                              return const Text("Awaiting Bids....");
                            case ConnectionState.waiting:
                              return const Text("Waiting....");
                            case ConnectionState.active:
                              return const Text("Connection is active");
                            case ConnectionState.done:
                              return Text(
                                workerSnapshot.data!.name,
                                textAlign: TextAlign.center,
                              );
                              ;
                          }
                        },
                      ),
              ),
              Expanded(
                flex: 3,
                child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: widget.ticket!.is_payment_due == 0
                            ? Colors.green
                            : Colors.red,
                        borderRadius: BorderRadius.circular(
                          3,
                        ),
                      ),
                      child: Text(
                        widget.ticket!.is_payment_due == 0
                            ? "Paid"
                            : "Not Paid",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 7,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: widget.ticket!.is_closed == 1
                            ? Colors.blue[900]
                            : Colors.yellow[800],
                        borderRadius: BorderRadius.circular(
                          3,
                        ),
                      ),
                      child: Text(
                        widget.ticket!.is_closed == 1 ? "Closed" : "Not Closed",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
