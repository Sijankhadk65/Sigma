import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/inventory_bloc.dart';
import 'package:sigma_app/src/bloc/sales_bloc.dart';
import 'package:sigma_app/src/models/sales_item.dart';
import 'package:sigma_app/src/models/stock_item.dart';

class AddSalesScreen extends StatefulWidget {
  const AddSalesScreen({super.key});

  @override
  State<AddSalesScreen> createState() => _AddSalesScreenState();
}

class _AddSalesScreenState extends State<AddSalesScreen> {
  InventoryBloc? _inventoryBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _inventoryBloc = Provider.of<InventoryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _inventoryBloc!.getStockItems();
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(
                    10,
                  ),
                  child: Material(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bill to",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: StreamBuilder<String>(
                                  stream: _inventoryBloc!.customerName,
                                  builder: (context, snapshot) {
                                    return TextField(
                                      onChanged:
                                          _inventoryBloc!.changeCustomerName,
                                      decoration: const InputDecoration(
                                        hintText: "Customer's Name",
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: StreamBuilder<String>(
                                  stream: _inventoryBloc!.customerAddress,
                                  builder: (context, snapshot) {
                                    return TextField(
                                      onChanged:
                                          _inventoryBloc!.changeCustomerAddress,
                                      decoration: const InputDecoration(
                                        hintText: "Customer's Address",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          StreamBuilder<String>(
                            stream: _inventoryBloc!.customerPhone,
                            builder: (context, snapshot) {
                              return TextField(
                                onChanged: _inventoryBloc!.changecustomerPhone,
                                decoration: const InputDecoration(
                                  hintText: "Customer's Phone",
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    StreamBuilder<List<StockItem>>(
                      stream: _inventoryBloc!.stockItems,
                      builder: (context, stockItemSnapshot) {
                        if (stockItemSnapshot.hasError) {
                          return Text(
                            "${stockItemSnapshot.error}",
                          );
                        }
                        switch (stockItemSnapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text("Awaiting bids...");
                          case ConnectionState.waiting:
                            return const Text("Waiting...");
                          case ConnectionState.active:
                            return StreamBuilder<StockItem>(
                              stream: _inventoryBloc!.currentlySelectedSI,
                              builder: (context, snapshot) {
                                _inventoryBloc!.changeCurrentlySelectedSI(
                                  stockItemSnapshot.data![0],
                                );
                                return DropdownButton<StockItem>(
                                  value: snapshot.data,
                                  items: stockItemSnapshot.data!
                                      .map<DropdownMenuItem<StockItem>>(
                                        (e) => DropdownMenuItem<StockItem>(
                                          value: e,
                                          child: Text(e.item_name),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) {},
                                );
                              },
                            );
                          case ConnectionState.done:
                            return const Text("Connection is Done");
                        }
                      },
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: _inventoryBloc!.changecurrentSIQuantity,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _inventoryBloc!.addSalesItems();
                      },
                      child: const Text("Add Item"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(
                10,
              ),
              child: Material(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Issued Date",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: Text(
                                        "Billed to",
                                        textAlign: TextAlign.end,
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: StreamBuilder<String>(
                                      stream: _inventoryBloc!.customerName,
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.hasData
                                              ? snapshot.data!
                                              : "N/A",
                                          textAlign: TextAlign.end,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Divider(),
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Address",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      child: StreamBuilder<String>(
                                        stream: _inventoryBloc!.customerAddress,
                                        builder: (context, snapshot) {
                                          return Text(
                                            snapshot.hasData
                                                ? snapshot.data!
                                                : "N/A",
                                            textAlign: TextAlign.end,
                                            style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Phone Number",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: StreamBuilder<String>(
                                      stream: _inventoryBloc!.customerPhone,
                                      builder: (context, snapshot) {
                                        return Text(
                                          snapshot.hasData
                                              ? snapshot.data!
                                              : "N/A",
                                          textAlign: TextAlign.end,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Payment Method",
                                      style: GoogleFonts.nunito(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Expanded(
                                    child: StreamBuilder<String>(
                                      stream: _inventoryBloc!.paymentMethod,
                                      builder: (context, snapshot) {
                                        return DropdownButton<String>(
                                          value: snapshot.data,
                                          items: [
                                            "cash",
                                            "cheque",
                                            "bank_transfer",
                                            "esewa",
                                            "khalti",
                                            "fone_pay",
                                          ]
                                              .map<DropdownMenuItem<String>>(
                                                (e) => DropdownMenuItem(
                                                  value: e,
                                                  child: Text(e),
                                                ),
                                              )
                                              .toList(),
                                          onChanged: (value) {
                                            _inventoryBloc!
                                                .changePaymentMethod(value!);
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 10,
                        ),
                        child: Text(
                          "Item Details",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: StreamBuilder<List<SalesItem>>(
                          stream: _inventoryBloc!.currentSalesItems,
                          builder: (context, snapshot) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  snapshot.hasData ? snapshot.data!.length : 0,
                              itemBuilder: (context, index) => Row(
                                children: [
                                  Expanded(
                                    child:
                                        Text(snapshot.data![index].item_name),
                                  ),
                                  Expanded(
                                    child: Text(
                                        "${snapshot.data![index].quantity}"),
                                  ),
                                  Expanded(
                                    child: Text(
                                        "${snapshot.data![index].unit_price}"),
                                  ),
                                  Expanded(
                                    child:
                                        Text("${snapshot.data![index].total}"),
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.remove),
                                      onPressed: () {
                                        _inventoryBloc!.removeSalesItem(index);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _inventoryBloc!.createSales();
                            },
                            child: const Text("Add New Sales"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
