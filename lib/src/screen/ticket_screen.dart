import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/server/repository.dart';
import 'package:sigma_app/src/widgets/ticket_card.dart';

import '../models/ticket.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  TicketBloc? _ticketBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticketBloc = Provider.of<TicketBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _ticketBloc!.getTickets();
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(
          10,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "ID",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Device Manufacturer",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Device Model",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Status",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Customer",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Issues",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Assigned to",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Actions",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Close",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Bill",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Divider(),
              Expanded(
                child: StreamBuilder<List<Ticket?>>(
                  stream: _ticketBloc!.tickets,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) return Text("${snapshot.error}");
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text("Awaiting Bids....");
                      case ConnectionState.waiting:
                        return const Text("Waiting....");
                      case ConnectionState.active:
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  final ticket = snapshot.data![index];
                                  return TicketCard(
                                    ticket: ticket,
                                    ticketBloc: _ticketBloc,
                                  );
                                },
                              )
                            : const Text("No Data");
                      case ConnectionState.done:
                        return Container();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
