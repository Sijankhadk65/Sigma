import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/bloc/sales_bloc.dart';
import 'package:sigma_app/src/models/sales.dart';
import 'package:sigma_app/src/screen/add_sales_screen.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  InventoryBloc? _inventoryBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _inventoryBloc = Provider.of<InventoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _inventoryBloc!.getSales();
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Provider(
                      create: (context) => InventoryBloc(),
                      child: const AddSalesScreen(),
                    ),
                  ),
                );
              },
              child: const Text("Add Sales"),
            ),
            Row(
              children: const [
                Expanded(
                  child: Text("ID"),
                ),
                Expanded(
                  child: Text("Customer Details"),
                ),
                Expanded(
                  child: Text("Amount"),
                ),
                Expanded(
                  child: Text("Sold On"),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<Sales>>(
                stream: _inventoryBloc!.sales,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text("Awaiting bids...");
                    case ConnectionState.waiting:
                      return const Text("Waiting...");
                    case ConnectionState.active:
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                        itemBuilder: (context, index) => const Text("Sales"),
                      );
                    case ConnectionState.done:
                      return const Text("Connection Done");
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
