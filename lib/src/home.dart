import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/account_bloc.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/bloc/transactions_bloc.dart';
import 'package:sigma_app/src/bloc/worker_bloc.dart';
import 'package:sigma_app/src/screen/accounts_screen.dart';
import 'package:sigma_app/src/screen/add_ticket_screen.dart';
import 'package:sigma_app/src/screen/dash_screen.dart';
import 'package:sigma_app/src/screen/sales_screen.dart';
import 'package:sigma_app/src/screen/stock_items_screen.dart';
import 'package:sigma_app/src/screen/ticket_screen.dart';
import 'package:sigma_app/src/screen/transactions_screen.dart';
import 'package:sigma_app/src/screen/worker_screen.dart';
import 'package:sigma_app/src/widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _selectedPage = "dashboard";

  void changeSelectedPage(String newPage) {
    setState(() {
      _selectedPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Navbar(
                    selectedPage: _selectedPage,
                    changeSelectedPage: (value) {
                      changeSelectedPage(value);
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Navigator(
                    pages: [
                      if (_selectedPage == "dashboard")
                        const MaterialPage(
                          child: DashScreen(),
                        ),
                      if (_selectedPage == "sales")
                        MaterialPage(
                          child: Provider(
                            create: (context) => InventoryBloc(),
                            child: SalesScreen(),
                          ),
                        ),
                      if (_selectedPage == "stock")
                        MaterialPage(
                          child: Provider(
                            create: ((context) => InventoryBloc()),
                            child: StockItemsScreen(),
                          ),
                        ),
                      if (_selectedPage == "tickets")
                        MaterialPage(
                          child: Provider(
                            create: ((context) => TicketBloc()),
                            child: const TicketScreen(),
                            dispose: (context, TicketBloc bloc) =>
                                bloc.dispose(),
                          ),
                        ),
                      if (_selectedPage == "transactions")
                        MaterialPage(
                          child: Provider(
                            create: ((context) => TransactionsBloc()),
                            child: const TransactionsScreen(),
                            dispose: (context, TransactionsBloc bloc) =>
                                bloc.dispose(),
                          ),
                        ),
                      if (_selectedPage == "workers")
                        MaterialPage(
                          child: Provider(
                            create: ((context) => WorkerBloc()),
                            child: const WorkerScreen(),
                            dispose: (context, WorkerBloc bloc) =>
                                bloc.dispose(),
                          ),
                        ),
                      if (_selectedPage == "accounts")
                        MaterialPage(
                          child: Provider(
                            create: ((context) => AccountBloc()),
                            child: const AccountsScreen(),
                            dispose: (context, AccountBloc bloc) =>
                                bloc.dispose(),
                          ),
                        ),
                    ],
                    onPopPage: (route, result) => route.didPop(result),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
