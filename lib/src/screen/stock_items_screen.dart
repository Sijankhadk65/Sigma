import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/screen/add_stock_item.dart';

class StockItemsScreen extends StatefulWidget {
  const StockItemsScreen({super.key});

  @override
  State<StockItemsScreen> createState() => _StockItemsScreenState();
}

class _StockItemsScreenState extends State<StockItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: const Text("Create Stock Item"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Provider(
                  create: (context) => InventoryBloc(),
                  child: AddStockItem(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
