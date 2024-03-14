import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/bloc/worker_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/expense.dart';
import 'package:sigma_app/src/models/issue.dart';
import 'package:sigma_app/src/models/stock_item.dart';
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
  InventoryBloc? _inventoryBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticketBloc = Provider.of<TicketBloc>(context);
    _workerBloc = Provider.of<WorkerBloc>(context);
    _inventoryBloc = Provider.of<InventoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _ticketBloc!.getTicket(widget.ticketID!);
    _ticketBloc!.getTicketExpenses(widget.ticketID!);
    _inventoryBloc!.getStockItems();
    _workerBloc!.getWorkers();
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(
                        10,
                      ),
                      child: Material(
                        elevation: 5,
                        child: Row(
                          children: [
                            Expanded(
                              child: customerSection(snapshot),
                            ),
                            Expanded(
                              child: workerSelector(snapshot),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(
                          10,
                        ),
                        child: Material(
                          elevation: 5,
                          child: Row(
                            children: [
                              Expanded(
                                child: IssueSection(
                                  ticketBloc: _ticketBloc,
                                  ticketID: widget.ticketID!,
                                ),
                              ),
                              Expanded(
                                child: expenseSection(
                                  snapshot,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(
                          10,
                        ),
                        child: Material(
                          elevation: 5,
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text("Update Cost"),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: RadioGroup<String>.builder(
                                  groupValue: "pending",
                                  onChanged: (value) {},
                                  items: const [
                                    "pending",
                                    "returned",
                                    "completed",
                                  ],
                                  itemBuilder: (value) => RadioButtonBuilder(
                                    value,
                                    textPosition: RadioButtonTextPosition.left,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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

  StreamBuilder<Customer?> customerSection(AsyncSnapshot<Ticket?> snapshot) {
    return StreamBuilder<Customer?>(
      stream: _ticketBloc!.getTicketCustomer(snapshot.data!.customer_id!),
      builder: ((context, customerSnapshot) {
        if (customerSnapshot.hasError) {
          return Text(customerSnapshot.error.toString());
        }
        switch (customerSnapshot.connectionState) {
          case ConnectionState.none:
            return const Text("Awaiting Bids....");
          case ConnectionState.waiting:
            return const Text("Waiting....");
          case ConnectionState.active:
            return const Text("Connection Active");
          case ConnectionState.done:
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerSnapshot.data!.name,
                ),
                Text(
                  customerSnapshot.data!.address,
                ),
                Text(
                  customerSnapshot.data!.ph_number.toString(),
                ),
              ],
            );
        }
      }),
    );
  }

  Column workerSelector(AsyncSnapshot<Ticket?> snapshot) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<List<Worker?>>(
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
                if (workersSnapshot.hasData &&
                    workersSnapshot.data!.isNotEmpty) {
                  _ticketBloc!.changeTicketWorker(workersSnapshot.data![0]!);
                }

                return workersSnapshot.hasData &&
                        workersSnapshot.data!.isNotEmpty
                    ? Row(
                        children: [
                          StreamBuilder<Worker?>(
                            stream: _ticketBloc!.ticketWorker,
                            builder: (context, ticketWorkerSnapshot) {
                              return DropdownButton<Worker>(
                                value: ticketWorkerSnapshot.data,
                                items: workersSnapshot.hasData &&
                                        workersSnapshot.data!.isNotEmpty
                                    ? workersSnapshot.data!
                                        .map<DropdownMenuItem<Worker>>(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e!.name,
                                            ),
                                          ),
                                        )
                                        .toList()
                                    : [],
                                onChanged: (value) {
                                  _ticketBloc!.changeTicketWorker(value!);
                                },
                              );
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
                      )
                    : const Text("No Workers added to the system");
              case ConnectionState.done:
                return Text("${workersSnapshot.data}");
            }
          }),
        ),
        StreamBuilder<Worker?>(
            stream: _ticketBloc!.getTicketWorker(
              snapshot.data!.serviced_by == null
                  ? "null"
                  : snapshot.data!.serviced_by!,
            ),
            builder: (context, currentWorkerSnapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              switch (currentWorkerSnapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("Awiating Bids...");
                case ConnectionState.waiting:
                  return const Text("Waiting");
                case ConnectionState.active:
                  return const Text("Connection Active");
                case ConnectionState.done:
                  return Text(
                    "Assigned Worker: ${currentWorkerSnapshot.hasData ? currentWorkerSnapshot.data!.name : "NA"}",
                  );
              }
            })
      ],
    );
  }

  Column expenseSection(AsyncSnapshot<Ticket?> snapshot) {
    return Column(
      children: [
        StreamBuilder<List<StockItem>?>(
          stream: _inventoryBloc!.stockItems,
          builder: (context, stockSnapshot) {
            if (snapshot.hasError) {
              return Text("${stockSnapshot.error}");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("Awaiting Bids...");
              case ConnectionState.waiting:
                return const Text("Waiting....");
              case ConnectionState.active:
                if (stockSnapshot.hasData && stockSnapshot.data!.isNotEmpty) {
                  _ticketBloc!.changeStockItem(
                    stockSnapshot.data![0],
                  );
                } else {
                  _ticketBloc!.changeStockItem(null);
                }

                return stockSnapshot.hasData && stockSnapshot.data!.isNotEmpty
                    ? Row(
                        children: [
                          Expanded(
                            child: StreamBuilder<StockItem?>(
                              stream: _ticketBloc!.stockItem,
                              builder: (context, snapshot) {
                                return DropdownButton<StockItem>(
                                  value: snapshot.data,
                                  items: stockSnapshot.data!
                                      .map<DropdownMenuItem<StockItem>>(
                                        (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e.item_name,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {
                                    _ticketBloc!.changeStockItem(
                                      value!,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              onChanged: _ticketBloc!.changeSalesItemQuantity,
                              decoration: const InputDecoration(
                                hintText: "Quantity",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _ticketBloc!.addExpenseToTicket(widget.ticketID!);
                            },
                            child: const Text("Add Expense"),
                          ),
                        ],
                      )
                    : const Text("No Stock items Added");
              case ConnectionState.done:
                return const Text("Connection Done");
            }
          },
        ),
        Flexible(
          fit: FlexFit.loose,
          child: StreamBuilder<List<Expense?>>(
            stream: _ticketBloc!.ticketExpenses,
            builder: (context, expensesSnapshot) {
              if (expensesSnapshot.hasError) {
                return Text(expensesSnapshot.error.toString());
              }
              switch (expensesSnapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("Awaiting Bids...");
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.active:
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: expensesSnapshot.data!.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${index + 1}",
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            expensesSnapshot.data![index]!.item_name,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            "${expensesSnapshot.data![index]!.cost}",
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _ticketBloc!.deleteExpense(
                                expensesSnapshot.data![index]!.id!,
                                expensesSnapshot.data![index]!.cost,
                                expensesSnapshot.data![index]!.quantity,
                                expensesSnapshot.data![index]!.item_id,
                                widget.ticketID!);
                          },
                          icon: const Icon(
                            Icons.remove,
                          ),
                        )
                      ],
                    ),
                  );
                case ConnectionState.done:
                  return const Text("Connection done");
              }
            },
          ),
        ),
      ],
    );
  }
}

class IssueSection extends StatelessWidget {
  const IssueSection({
    Key? key,
    required TicketBloc? ticketBloc,
    required this.ticketID,
  })  : _ticketBloc = ticketBloc,
        super(key: key);

  final TicketBloc? _ticketBloc;
  final String ticketID;

  @override
  Widget build(BuildContext context) {
    _ticketBloc!.getTicketIssues(ticketID);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: _ticketBloc!.changepostIssueDesc,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _ticketBloc!.postNewIssue(ticketID);
              },
              child: const Text(
                "Add Issue",
              ),
            )
          ],
        ),
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
                return issueSnapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: issueSnapshot.data!.length,
                        itemBuilder: ((context, index) => Row(
                              children: [
                                Text(
                                  "${index + 1}. ${issueSnapshot.data![index]!.description}",
                                ),
                                const Spacer(),
                                ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.done),
                                  label: const Text("Completed"),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _ticketBloc!.deleteIssue(
                                      issueSnapshot.data![index]!.id!,
                                      ticketID,
                                    );
                                  },
                                  icon: const Icon(Icons.close),
                                  label: const Text("Delete"),
                                )
                              ],
                            )),
                      )
                    : const Text("No Data");
              case ConnectionState.done:
                return const Text("Connection Done");
            }
          },
        ),
      ],
    );
  }
}
