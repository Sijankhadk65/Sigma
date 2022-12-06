import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';

class AddStockItem extends StatefulWidget {
  const AddStockItem({super.key});

  @override
  State<AddStockItem> createState() => _AddStockItemState();
}

class _AddStockItemState extends State<AddStockItem> {
  InventoryBloc? _inventoryBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _inventoryBloc = Provider.of<InventoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: _inventoryBloc!.changeItemName,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: StreamBuilder<XFile>(
                    stream: _inventoryBloc!.itemPhoto,
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.hasData
                            ? snapshot.data!.name
                            : "No File Choosen",
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _inventoryBloc!.choosePhoto();
                  },
                  child: const Text(
                    "Choose photo",
                  ),
                )
              ],
            ),
            TextField(
              onChanged: _inventoryBloc!.changequantity,
              decoration: const InputDecoration(
                hintText: "quantity",
              ),
            ),
            TextField(
              onChanged: _inventoryBloc!.changeitemUnitPrice,
              decoration: const InputDecoration(
                hintText: "unit price",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _inventoryBloc!.createStockItem();
              },
              child: const Text("Save new Item"),
            ),
          ],
        ),
      ),
    );
  }
}
