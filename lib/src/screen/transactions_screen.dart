import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/transactions_bloc.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/screen/add_transaction_screen.dart';
import 'package:sigma_app/src/widgets/paginator.dart';
import 'package:web_date_picker/web_date_picker.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  TransactionsBloc? _transactionsBloc;
  final numberFormater = NumberFormat("#,##,##0.00");
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _transactionsBloc = Provider.of<TransactionsBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _transactionsBloc!.getTransactions();
    return Scaffold(
      body: Container(
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
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transaction",
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          "Manage all your recent transactions",
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
                              create: ((context) => TransactionsBloc()),
                              child: const AddTransactionScreen(),
                              dispose: (context, TransactionsBloc bloc) =>
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
                            "New Transaction",
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
                // elevation: 5,
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  5,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: StreamBuilder<List<Transaction>>(
                    stream: _transactionsBloc!.transactions,
                    builder: ((context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text("Awaiting bids...");
                        case ConnectionState.waiting:
                          return const Text("Waiting on data");
                        case ConnectionState.active:
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Material(
                                      elevation: 5,
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
                                              margin:
                                                  const EdgeInsets.symmetric(
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
                                  const Paginator(),
                                ],
                              ),
                              SizedBox.fromSize(
                                size: const Size.fromHeight(
                                  10,
                                ),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                          10,
                                        ),
                                        child: Text(
                                          "S.N",
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
                                        "Type",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Amount",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Description",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Payment Method",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        "Date",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.nunito(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) => Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "${index + 1}",
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              snapshot.data![index].source
                                                  .toUpperCase(),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  snapshot.data![index].type ==
                                                          "credit"
                                                      ? Icons
                                                          .arrow_upward_rounded
                                                      : Icons
                                                          .arrow_downward_rounded,
                                                  size: 12,
                                                  color: snapshot.data![index]
                                                              .type ==
                                                          "credit"
                                                      ? Colors.green
                                                      : Colors.red,
                                                ),
                                                Text(
                                                  " ${snapshot.data![index].type == "credit" ? "+" : "-"} Rs.${numberFormater.format(snapshot.data![index].amount)}",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              snapshot.data![index].description,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              snapshot
                                                  .data![index].payment_method,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Text(
                                              _getFormatttedTransactionDate(
                                                snapshot.data![index]
                                                    .transaction_at,
                                              ),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.nunito(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        case ConnectionState.done:
                          return const Text("Connnection is done");
                      }
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getFormatttedTransactionDate(String date) {
    DateTime dateTime = DateTime.parse(date);
    String _month = _getMonthName(dateTime.month);
    String _day = _getDay(dateTime.day);
    return " $_day $_month ${dateTime.year}, at ${dateTime.hour}:${dateTime.minute} ";
  }

  String _getMonthName(int month) {
    String monthName = "Jan";
    switch (month) {
      case 1:
        monthName = "Jan";
        break;
      case 2:
        monthName = "Feb";
        break;
      case 3:
        monthName = "Mar";
        break;
      case 4:
        monthName = "Apr";
        break;
      case 5:
        monthName = "May";
        break;
      case 6:
        monthName = "Jun";
        break;
      case 7:
        monthName = "Jul";
        break;
      case 8:
        monthName = "Aug";
        break;
      case 9:
        monthName = "Sep";
        break;
      case 10:
        monthName = "Oct";
        break;
      case 11:
        monthName = "Nov";
        break;
      case 12:
        monthName = "Dec";
        break;
    }
    return monthName;
  }

  String _getDay(int day) {
    String formattedDay = "1st";
    switch (day) {
      case 1:
        formattedDay = "1st";
        break;
      case 2:
        formattedDay = "2nd";
        break;
      case 3:
        formattedDay = "3rd";
        break;
      default:
        formattedDay = "${day}th";
        break;
    }
    return formattedDay;
  }
}
