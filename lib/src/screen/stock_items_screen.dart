import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/models/stock_item.dart';
import 'package:sigma_app/src/screen/add_stock_item.dart';

class StockItemsScreen extends StatefulWidget {
  const StockItemsScreen({super.key});

  @override
  State<StockItemsScreen> createState() => _StockItemsScreenState();
}

class _StockItemsScreenState extends State<StockItemsScreen> {
  InventoryBloc? _inventoryBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _inventoryBloc = Provider.of<InventoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _inventoryBloc!.getStockItems();
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
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
            Row(
              children: const [
                Expanded(
                  flex: 1,
                  child: Text("id"),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Name"),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Stock Status"),
                ),
                Expanded(
                  flex: 3,
                  child: Text("In Stock"),
                ),
                Expanded(
                  flex: 3,
                  child: Text("Price"),
                ),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<StockItem>>(
                stream: _inventoryBloc!.stockItems,
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return const Text("Awaiting bids....");
                    case ConnectionState.waiting:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    case ConnectionState.active:
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                snapshot.data![index].id!,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                snapshot.data![index].item_name,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                snapshot.data![index].quantity > 0
                                    ? "In Stock"
                                    : "Not In Stock",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "${snapshot.data![index].quantity} pcs",
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                "${snapshot.data![index].unit_price}",
                              ),
                            )
                          ],
                        ),
                      );
                    case ConnectionState.done:
                      return const Text("Connection is done");
                  }
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
