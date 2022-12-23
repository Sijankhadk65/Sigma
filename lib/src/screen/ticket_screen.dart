import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/screen/add_ticket_screen.dart';
import 'package:sigma_app/src/widgets/ticket_card.dart';
import 'package:sigma_app/src/widgets/total_cost_alert.dart';
import 'package:web_date_picker/web_date_picker.dart';

import '../models/ticket.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  TicketBloc? _ticketBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticketBloc = Provider.of<TicketBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _ticketBloc!.getTickets();
    return Container(
      margin: const EdgeInsets.all(
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ticket",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w800,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        "Manage all your tickets and their status",
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                          left: 10,
                          right: 15,
                          top: 15,
                          bottom: 15,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Provider(
                            create: ((context) => TicketBloc()),
                            child: const AddTicketScreen(),
                            dispose: (context, TicketBloc bloc) =>
                                bloc.dispose(),
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add_box_rounded,
                          size: 15,
                        ),
                        SizedBox.fromSize(
                          size: const Size(
                            5,
                            0,
                          ),
                        ),
                        Text(
                          "New Ticket",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Material(
                                  color: Colors.white,
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Start from",
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                            ),
                                            WebDatePicker(
                                              initialDate: DateTime.now(),
                                              onChange: (value) {
                                                print(value);
                                              },
                                            ),
                                          ],
                                        ),
                                        Container(
                                          width: 1,
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          color: Colors.black,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "End to",
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                            ),
                                            WebDatePicker(
                                              initialDate: DateTime.now(),
                                              onChange: (value) {
                                                print(value);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(
                                            5,
                                          ),
                                          bottomLeft: Radius.circular(
                                            5,
                                          ),
                                        ),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_back_ios_rounded,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Page 1",
                                        style: GoogleFonts.nunito(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.lightBlueAccent,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                            5,
                                          ),
                                          bottomRight: Radius.circular(
                                            5,
                                          ),
                                        ),
                                      ),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(
                                      "S.N.",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(
                                      "Device Manufacturer",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(
                                      "Device Model",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(
                                      "Customer",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(
                                      "Issues",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(
                                      "Assigned to",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.nunito(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Status",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                // Expanded(
                                //   flex: 3,
                                //   child: Text(
                                //     "Close",
                                //     textAlign: TextAlign.center,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          const Divider(),
                          Expanded(
                            child: StreamBuilder<List<Ticket?>>(
                              stream: _ticketBloc!.tickets,
                              builder: (context, snapshot) {
                                if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return const Text("Awaiting Bids....");
                                  case ConnectionState.waiting:
                                    return const Text("Waiting....");
                                  case ConnectionState.active:
                                    return snapshot.hasData
                                        ? ListView.builder(
                                            addAutomaticKeepAlives: true,
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, index) {
                                              final ticket =
                                                  snapshot.data![index];
                                              return Provider(
                                                create: (context) =>
                                                    TicketBloc(),
                                                child: TicketCard(
                                                  sn: index + 1,
                                                  ticket: ticket,
                                                  ticketBloc: _ticketBloc,
                                                ),
                                              );
                                            },
                                          )
                                        : const Text("No Data");
                                  case ConnectionState.done:
                                    return Container();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  StreamBuilder<List<Ticket>>(
                    stream: _ticketBloc!.parkedTickets,
                    builder: (context, snapshot) => snapshot.hasData &&
                            snapshot.data!.isNotEmpty
                        ? Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[900],
                              ),
                              margin: const EdgeInsets.only(
                                top: 15,
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 15,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    snapshot.hasData &&
                                            snapshot.data!.isNotEmpty
                                        ? "${snapshot.data!.length} tickets are currently selected !"
                                        : "",
                                    style: GoogleFonts.nunito(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox.fromSize(
                                    size: const Size.fromWidth(
                                      20,
                                    ),
                                  ),
                                  _ticketBloc!.parkedTicketsList[0]
                                              .is_payment_due ==
                                          0
                                      ? ElevatedButton(
                                          style: ButtonStyle(
                                            padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                              const EdgeInsets.all(
                                                20,
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  TotalCostAlertDialog(
                                                ticketBloc: _ticketBloc!,
                                              ),
                                            );
                                            // _ticketBloc!
                                            //     .createTicketTransaction();
                                          },
                                          child: Text(
                                            "Save Bills",
                                            style: GoogleFonts.nunito(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      : _ticketBloc!.parkedTicketsList[0]
                                                  .is_closed ==
                                              0
                                          ? ElevatedButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                  const EdgeInsets.all(
                                                    20,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                _ticketBloc!
                                                    .updateTicketOpenStatus();
                                              },
                                              child: Text(
                                                "Close Tickets",
                                                style: GoogleFonts.nunito(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          : ElevatedButton(
                                              style: ButtonStyle(
                                                padding: MaterialStateProperty
                                                    .all<EdgeInsets>(
                                                  const EdgeInsets.all(
                                                    20,
                                                  ),
                                                ),
                                              ),
                                              onPressed: () {
                                                _ticketBloc!
                                                    .updateTicketPaidStatus();
                                              },
                                              child: Text(
                                                "Save Payment",
                                                style: GoogleFonts.nunito(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                  // ElevatedButton(
                                  //   onPressed: () {},
                                  //   child: Text(
                                  //     "Bill",
                                  //     style: GoogleFonts.nunito(
                                  //       fontWeight: FontWeight.bold,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
