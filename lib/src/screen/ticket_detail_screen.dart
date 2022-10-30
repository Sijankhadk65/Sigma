import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/bloc/worker_bloc.dart';
import 'package:sigma_app/src/models/issue.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/worker.dart';

class TicketDetailScreen extends StatefulWidget {
  const TicketDetailScreen({
    Key? key,
    required this.ticketID,
    required this.workerID,
  }) : super(key: key);
  final String? ticketID;
  final String? workerID;

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {
  TicketBloc? _ticketBloc;
  WorkerBloc? _workerBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticketBloc = Provider.of<TicketBloc>(context);
    _workerBloc = Provider.of<WorkerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _ticketBloc!.getTicket(widget.ticketID!);
    _ticketBloc!.getTicketIssues(widget.ticketID!);
    if (widget.workerID != null) {
      _ticketBloc!.getTicketWorker(widget.workerID!);
    } else {
      _workerBloc!.getWorkers();
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<Ticket?>(
          stream: _ticketBloc!.ticket,
          builder: (context, snapshot) {
            if (snapshot.hasError) return Text("${snapshot.error}");
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("Awaiting Bids....");
              case ConnectionState.waiting:
                return const Text("Waiting....");
              case ConnectionState.active:
                return Column(
                  children: [
                    Text("${snapshot.data}"),
                    StreamBuilder<List<Issue?>>(
                      stream: _ticketBloc!.ticketIssues,
                      builder: (context, issueSnapshot) {
                        if (issueSnapshot.hasError) {
                          return Text("${issueSnapshot.error}");
                        }
                        switch (issueSnapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text("Awaiting Bids....");
                          case ConnectionState.waiting:
                            return const Text("Waiting....");
                          case ConnectionState.active:
                            return Text("${issueSnapshot.data}");
                          case ConnectionState.done:
                            return issueSnapshot.hasData
                                ? Text(
                                    issueSnapshot.data.toString(),
                                  )
                                : const Text("No Data");
                        }
                      },
                    ),
                    snapshot.data!.serviced_by != null
                        ? StreamBuilder<Worker?>(
                            stream: _ticketBloc!.ticketWorker,
                            builder: (context, ticketWorkerSnapshot) {
                              if (ticketWorkerSnapshot.hasError) {
                                return Text("${ticketWorkerSnapshot.error}");
                              }
                              switch (ticketWorkerSnapshot.connectionState) {
                                case ConnectionState.none:
                                  return const Text("Awaiting Bids....");
                                case ConnectionState.waiting:
                                  return const Text("Waiting....");
                                case ConnectionState.active:
                                  return Text("${ticketWorkerSnapshot.data}");
                                case ConnectionState.done:
                                  return ticketWorkerSnapshot.hasData
                                      ? Text(
                                          ticketWorkerSnapshot.data.toString(),
                                        )
                                      : const Text("No Data");
                              }
                            },
                          )
                        : StreamBuilder<List<Worker?>>(
                            stream: _workerBloc!.workers,
                            builder: ((context, workersSnapshot) {
                              if (workersSnapshot.hasError) {
                                return Text("${workersSnapshot.error}");
                              }
                              switch (workersSnapshot.connectionState) {
                                case ConnectionState.none:
                                  return const Text("Awaiting Bids....");
                                case ConnectionState.waiting:
                                  return const Text("Waiting....");
                                case ConnectionState.active:
                                  _ticketBloc!.changeTicketWorker(
                                      workersSnapshot.data![0]!);
                                  return Row(
                                    children: [
                                      DropdownButton<Worker>(
                                        items: workersSnapshot.data!
                                            .map<DropdownMenuItem<Worker>>(
                                              (e) => DropdownMenuItem(
                                                child: Text(
                                                  e!.name,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (value) {
                                          _ticketBloc!
                                              .changeTicketWorker(value!);
                                        },
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          _ticketBloc!.updateTicketWorker(
                                            widget.ticketID,
                                          );
                                        },
                                        child: const Text(
                                          "Assign Worker",
                                        ),
                                      ),
                                    ],
                                  );
                                case ConnectionState.done:
                                  return Text("${workersSnapshot.data}");
                              }
                            }),
                          ),
                  ],
                );
              case ConnectionState.done:
                return snapshot.hasData
                    ? Text(snapshot.data.toString())
                    : const Text("No Data");
            }
          },
        ),
      ),
    );
  }
}
