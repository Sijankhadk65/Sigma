import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/widgets/input_field.dart';

class TicketInputForm extends StatefulWidget {
  const TicketInputForm({
    Key? key,
    required TicketBloc? ticketBloc,
    required this.controllers,
  })  : _ticketBloc = ticketBloc,
        super(key: key);

  final TicketBloc? _ticketBloc;
  final List<TextEditingController> controllers;

  @override
  State<TicketInputForm> createState() => _TicketInputFormState();
}

class _TicketInputFormState extends State<TicketInputForm> {
  TextEditingController? _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(
        10,
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "Device Info",
                        style: GoogleFonts.nunito(),
                      ),
                    ),
                  ],
                ),
                InputField(
                  controller: widget.controllers[0],
                  onChanged: widget._ticketBloc!.changeDeviceManufacturer,
                  fieldHint: "Lenovo",
                  fieldLabel: "Device Manufacturer",
                ),
                InputField(
                  controller: widget.controllers[1],
                  onChanged: widget._ticketBloc!.changeDeviceModel,
                  fieldHint: "Li-300000",
                  fieldLabel: "Device Model",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        "Customer's Info",
                        style: GoogleFonts.nunito(),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Customer's Phone",
                          style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            border: Border.all(
                              color: Colors.black26,
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.only(
                            left: 10,
                          ),
                          child: TextField(
                            controller: widget.controllers[2],
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "98-XXX-XXXXX",
                              hintStyle: GoogleFonts.nunito(),
                            ),
                            onChanged: widget._ticketBloc!.changeCustomerPhone,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                              ),
                            ),
                            onPressed: () {
                              widget._ticketBloc!.getCustomerFromContact([
                                widget.controllers[3],
                                widget.controllers[4],
                              ]);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Search",
                                  style: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                                const Icon(
                                  Icons.search,
                                  size: 12,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InputField(
                  controller: widget.controllers[3],
                  onChanged: widget._ticketBloc!.changeCustomerName,
                  fieldHint: "John Doe",
                  fieldLabel: "Customer's Name",
                ),
                InputField(
                  controller: widget.controllers[4],
                  onChanged: widget._ticketBloc!.changeCustomerAddress,
                  fieldHint: "Sukkhanagar",
                  fieldLabel: "Customer's Address",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                flex: 5,
                child: Text(
                  "Issue",
                  style: GoogleFonts.nunito(),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    "Issue Description",
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      border: Border.all(
                        color: Colors.black26,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "e.g. display is not working",
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          onPressed: () {
                            widget._ticketBloc!.addNewIssue();
                            _textEditingController!.clear();
                          },
                          icon: const Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                      minLines: 10,
                      maxLines: 10,
                      onChanged: widget._ticketBloc!.changeIssueDescription,
                    ),
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
