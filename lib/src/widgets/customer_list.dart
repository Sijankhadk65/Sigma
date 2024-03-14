import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/customer_select_bloc.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';

class CustomerList extends StatefulWidget {
  const CustomerList({
    Key? key,
    required this.ticketBloc,
    required this.controllers,
  }) : super(key: key);

  final TicketBloc ticketBloc;
  final List<TextEditingController> controllers;

  @override
  State<CustomerList> createState() => _CustomerListState();
}

class _CustomerListState extends State<CustomerList> {
  CustomerSelectBloc? _customerSelectBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _customerSelectBloc = Provider.of<CustomerSelectBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _customerSelectBloc!.getCustomerList();
    _customerSelectBloc!.changeSelectedCustomer(null);
    return AlertDialog(
      title: const Text("Select Customers"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    _customerSelectBloc!.changeSearchTerm(value);
                  },
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _customerSelectBloc!.getCustomerList();
                },
                icon: Icon(Icons.search),
                label: const Text("Search"),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(
              10,
            ),
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(
                10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Name",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Address",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Contact No.",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: StreamBuilder<List<Customer>>(
              stream: _customerSelectBloc!.reuqestedCustomerList,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("Awaiting Bids...");
                  case ConnectionState.waiting:
                    return const Text("Waiting");
                  case ConnectionState.active:
                    return snapshot.hasData && snapshot.data!.isNotEmpty
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                fit: FlexFit.loose,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: snapshot.data!
                                        .map<Widget>(
                                          (e) => Container(
                                            margin: const EdgeInsets.all(
                                              10,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                _customerSelectBloc!
                                                    .changeCustomer(e.id!);
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                        child: Text(e.name)),
                                                    Expanded(
                                                        child: Text(e.address)),
                                                    Expanded(
                                                        child: Text(
                                                            "${e.ph_number}")),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Text("No Registered Customers Yet");
                  case ConnectionState.done:
                    return const Text("Connection Done");
                }
              },
            ),
          ),
          Flexible(
            child: StreamBuilder<Customer?>(
              stream: _customerSelectBloc!.selectedCustomer,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Text("Awaiting Bids...");
                  case ConnectionState.waiting:
                    return const Text("Waiting...");
                  case ConnectionState.active:
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Name: ",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: snapshot.hasData
                                    ? snapshot.data!.name
                                    : "N/A",
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Address: ",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: snapshot.hasData
                                    ? snapshot.data!.address
                                    : "N/A",
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Contact: ",
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: snapshot.hasData
                                    ? snapshot.data!.ph_number.toString()
                                    : "N/A",
                                style: GoogleFonts.nunito(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  case ConnectionState.done:
                    return const Text("Connection Done");
                }
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _customerSelectBloc!.passSelectedCustomer(
                widget.ticketBloc,
                widget.controllers,
              );
              Navigator.pop(context);
            },
            child: const Text("Select Customer"),
          )
        ],
      ),
    );
  }
}
