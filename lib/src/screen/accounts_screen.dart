import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/account_bloc.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({super.key});

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  AccountBloc? _accountBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _accountBloc = Provider.of<AccountBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _accountBloc!.getTransactions();
    return Scaffold(
      // appBar: AppBar(),
      body: StreamBuilder(
        stream: _accountBloc!.transactions,
        builder: ((context, snapshot) {
          if (snapshot.hasError) return Text("${snapshot.error}");
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text("Awaiting Bids....");
            case ConnectionState.waiting:
              return const Text("Waiting....");
            case ConnectionState.active:
              return Text("${snapshot.data}");
            case ConnectionState.done:
              return Text("${snapshot.data}");
          }
        }),
      ),
    );
  }
}
