import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/transactions_bloc.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TransactionsBloc? _transactionsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _transactionsBloc = Provider.of<TransactionsBloc>(context);
    _transactionsBloc!.changeTransactionType("credit");
    _transactionsBloc!.changeTransactionSource("sales");
    _transactionsBloc!.changePaymentType("cash");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            TextField(
              onChanged: _transactionsBloc!.changeTransactionDescription,
              decoration: const InputDecoration(
                hintText: "Description",
              ),
            ),
            TextField(
              onChanged: _transactionsBloc!.changeTransactionAmount,
              decoration: const InputDecoration(
                hintText: "amount",
              ),
            ),
            StreamBuilder<String>(
                stream: _transactionsBloc!.transactionType,
                builder: (context, snapshot) {
                  return DropdownButton<String>(
                    value: snapshot.data,
                    onChanged: ((value) {
                      _transactionsBloc!.changeTransactionType(value!);
                    }),
                    items: [
                      "credit",
                      "debit",
                    ]
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                  );
                }),
            StreamBuilder<String>(
                stream: _transactionsBloc!.transactionSource,
                builder: (context, snapshot) {
                  return DropdownButton<String>(
                    value: snapshot.data,
                    onChanged: ((value) {
                      _transactionsBloc!.changeTransactionSource(value!);
                    }),
                    items: [
                      "sales",
                      "service",
                      "cash",
                      "hardware",
                      "utility",
                    ]
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                  );
                }),
            StreamBuilder<String>(
                stream: _transactionsBloc!.paymentType,
                builder: (context, snapshot) {
                  return DropdownButton<String>(
                    value: snapshot.data,
                    onChanged: ((value) {
                      _transactionsBloc!.changePaymentType(value!);
                    }),
                    items: [
                      "cash",
                      "cheque",
                      "bank_transfer",
                      "esewa",
                      "khalti",
                      "fone_pay",
                    ]
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                  );
                }),
            Center(
              child: StreamBuilder<bool>(
                  stream: _transactionsBloc!.isSaving,
                  builder: (context, snapshot) {
                    return snapshot.data == true
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              _transactionsBloc!.createNewTransaction();
                            },
                            child: const Text("Save Transaction"),
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
