import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/widgets/summary_item.dart';

import '../models/issue.dart';

class TicketSummary extends StatelessWidget {
  const TicketSummary({
    Key? key,
    required TicketBloc? ticketBloc,
  })  : _ticketBloc = ticketBloc,
        super(key: key);

  final TicketBloc? _ticketBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        20,
      ),
      child: Material(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Summary",
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customer's Info",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        SummaryItem(
                          childLabel: "Customer's Name",
                          childStream: _ticketBloc!.customerName,
                          placeholder: "John Doe",
                        ),
                        SummaryItem(
                          childLabel: "Customer's Contact",
                          childStream: _ticketBloc!.customerPhone,
                          placeholder: "98-XXX-XXXXX",
                        ),
                        SummaryItem(
                          childLabel: "Customer's Address",
                          childStream: _ticketBloc!.customerAddress,
                          placeholder: "Sukkhanagar",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Device Info",
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        SummaryItem(
                          childLabel: "Device Manufacturer",
                          childStream: _ticketBloc!.deviceManufacturer,
                          placeholder: "Lenovo",
                        ),
                        SummaryItem(
                          childLabel: "Device Model",
                          childStream: _ticketBloc!.deviceModel,
                          placeholder: "Li5",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SummaryItem(
                childLabel: "Open Date",
                child: StreamBuilder<DateTime?>(
                  stream: _ticketBloc!.openedDate,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.hasData
                          ? "${snapshot.data!.day}/${snapshot.data!.month}/${snapshot.data!.year}"
                          : "N/A",
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.end,
                    );
                  },
                ),
              ),
              const Divider(
                height: 20,
              ),
              Text(
                "Issues",
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: StreamBuilder<List<Issue?>>(
                  stream: _ticketBloc!.ticketIssues,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${index + 1}. ${snapshot.data![index]!.description}",
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              _ticketBloc!.removeIssue(index);
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              StreamBuilder<bool>(
                stream: _ticketBloc!.isSaving,
                builder: (context, snapshot) {
                  return snapshot.data == false
                      ? Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _ticketBloc!.saveTicket();
                            },
                            child: Text(
                              "Save Ticket",
                              style: GoogleFonts.nunito(),
                            ),
                          ),
                        )
                      : const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
