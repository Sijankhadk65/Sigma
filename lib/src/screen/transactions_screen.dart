import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/transactions_bloc.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/screen/add_transaction_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  TransactionsBloc? _transactionsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _transactionsBloc = Provider.of<TransactionsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _transactionsBloc!.getTransactions();
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        child: StreamBuilder<List<Transaction>>(
          stream: _transactionsBloc!.transactions,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text("Awaiting bids...");
              case ConnectionState.waiting:
                return const Text("Waiting on data");
              case ConnectionState.active:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Provider(
                                  create: ((context) => TransactionsBloc()),
                                  child: const AddTransactionScreen(),
                                  dispose: (context, TransactionsBloc bloc) =>
                                      bloc.dispose(),
                                )),
                          ),
                        );
                      },
                      child: const Text("New Transaction"),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Expanded(
                          child: Text("ID"),
                        ),
                        Expanded(
                          child: Text("Amount"),
                        ),
                        Expanded(
                          child: Text("Description"),
                        ),
                        Expanded(
                          child: Text("Payment Method"),
                        ),
                        Expanded(
                          child: Text("Payment Source"),
                        ),
                        Expanded(
                          child: Text("Transaction Date"),
                        ),
                        Expanded(
                          child: Text("Actions"),
                        ),
                      ],
                    ),
                    Divider(),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text("${snapshot.data![index].id}"),
                                ),
                                Expanded(
                                  child: Text(
                                    " ${snapshot.data![index].type == "credit" ? "" : "-"} Rs.${snapshot.data![index].amount}",
                                    style: TextStyle(
                                      color:
                                          snapshot.data![index].type == "credit"
                                              ? Colors.green
                                              : Colors.red,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child:
                                      Text(snapshot.data![index].description),
                                ),
                                Expanded(
                                  child: Text(
                                      snapshot.data![index].payment_method),
                                ),
                                Expanded(
                                  child: Text(snapshot.data![index].source),
                                ),
                                Expanded(
                                  child: Text(
                                    snapshot.data![index].transaction_at,
                                  ),
                                ),
                                Expanded(
                                    child: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {},
                                )),
                              ],
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              case ConnectionState.done:
                return const Text("Connnection is done");
            }
          }),
        ),
      ),
    );
  }
}
