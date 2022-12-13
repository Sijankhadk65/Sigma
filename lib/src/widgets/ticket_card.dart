import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/worker.dart';

class TicketCard extends StatefulWidget {
  const TicketCard({
    Key? key,
    required this.ticket,
    required TicketBloc? ticketBloc,
    required this.sn,
  })  : _ticketBloc = ticketBloc,
        super(key: key);

  final Ticket? ticket;
  final TicketBloc? _ticketBloc;
  final int sn;

  @override
  State<TicketCard> createState() => _TicketCardState();
}

class _TicketCardState extends State<TicketCard> {
  bool _isSelected = false;

  void _changeSelection() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ticket!.serviced_by != null) {
      widget._ticketBloc!.getTicketWorker(widget.ticket!.serviced_by!);
    }
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Checkbox(
                value: _isSelected,
                onChanged: (value) {
                  if (_isSelected) {
                    widget._ticketBloc!.unparkTicket(widget.ticket!);
                  } else {
                    widget._ticketBloc!.parkTicket(widget.ticket!);
                  }
                  _changeSelection();
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
            // Expanded(
            //   flex: 3,
            //   child: LayoutBuilder(builder: (context, constraints) {
            //     return Container(
            //       width: constraints.maxWidth * 0.3,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(
            //           10,
            //         ),
            //         border: Border.all(
            //           width: 2,
            //           color: widget.ticket!.is_payment_due == 1
            //               ? Colors.red
            //               : Colors.green,
            //         ),
            //       ),
            //       child: Material(
            //         color: Colors.transparent,
            //         child: InkWell(
            //           borderRadius: BorderRadius.circular(
            //             10,
            //           ),
            //           onTap: () {
            //             if (widget.ticket!.is_payment_due == 1) {
            //               widget._ticketBloc!
            //                   .updateTicketPaidStatus(widget.ticket!.id);
            //             }
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(
            //               horizontal: 10,
            //               vertical: 5,
            //             ),
            //             child: Center(
            //               child: Text(
            //                 widget.ticket!.is_payment_due == 1
            //                     ? "Not Paid"
            //                     : "Paid",
            //                 style: GoogleFonts.nunito(
            //                   fontWeight: FontWeight.bold,
            //                   color: widget.ticket!.is_payment_due == 1
            //                       ? Colors.red
            //                       : Colors.green,
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     );
            //   }),
            // ),
            Expanded(
              flex: 5,
              child: StreamBuilder<Customer?>(
                stream: widget._ticketBloc!
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
                      return Text("${customerSnapshot.data}");
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
                      stream: widget._ticketBloc!.ticketWorker,
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
                            return Text(
                              workerSnapshot.data!.name,
                              textAlign: TextAlign.center,
                            );
                          case ConnectionState.done:
                            return const Text("Connection is done");
                        }
                      },
                    ),
            ),
            // Expanded(
            //   flex: 3,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       IconButton(
            //         onPressed: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) => MultiProvider(
            //                 providers: [
            //                   Provider(
            //                     create: (_) => TicketBloc(),
            //                     dispose: (context, TicketBloc bloc) =>
            //                         bloc.dispose(),
            //                   ),
            //                   Provider(
            //                     create: (_) => WorkerBloc(),
            //                     dispose: (context, WorkerBloc bloc) =>
            //                         bloc.dispose(),
            //                   ),
            //                   Provider(
            //                     create: (_) => InventoryBloc(),
            //                     dispose: (context, InventoryBloc bloc) =>
            //                         bloc.dispose(),
            //                   ),
            //                 ],
            //                 child: TicketDetailScreen(
            //                   ticketID: ticket!.id,
            //                   workerID: ticket!.serviced_by,
            //                 ),
            //               ),
            //             ),
            //           );
            //         },
            //         icon: const Icon(Icons.edit),
            //       ),
            //       IconButton(
            //         onPressed: () {
            //           _ticketBloc!.deleteTicket(ticket!.id!);
            //         },
            //         icon: const Icon(Icons.delete),
            //       ),
            //     ],
            //   ),
            // ),
            // Expanded(
            //   flex: 3,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       _ticketBloc!.updateTicketOpenStatus(ticket!.id!);
            //     },
            //     child: const Text("close"),
            //   ),
            // ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
