import 'package:flutter/material.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/issue.dart';

class TotalCostAlertDialog extends StatefulWidget {
  const TotalCostAlertDialog({
    super.key,
    required this.ticketBloc,
  });
  final TicketBloc ticketBloc;

  @override
  State<TotalCostAlertDialog> createState() => _TotalCostAlertDialogState();
}

class _TotalCostAlertDialogState extends State<TotalCostAlertDialog> {
  bool _isMultiple = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Cost for the bills'),
          Row(
            children: [
              Checkbox(
                  value: _isMultiple,
                  onChanged: (value) {
                    setState(() {
                      _isMultiple = value!;
                    });
                  }),
              const Text("Select different for different bills"),
            ],
          )
        ],
      ),
      content: _isMultiple
          ? SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: widget.ticketBloc.parkedTicketsList
                    .map<Widget>(
                      (ticket) => Row(
                        children: [
                          Text(
                            "${ticket.device_manufacturer} : ${ticket.device_model}",
                          ),
                          Expanded(
                            child: StreamBuilder<List<Issue?>>(
                              stream: widget.ticketBloc
                                  .getTicketIssuesFunc(ticket.id!),
                              builder: (context, issueSnapshot) {
                                if (issueSnapshot.hasError) {
                                  return Text("${issueSnapshot.error}");
                                }
                                switch (issueSnapshot.connectionState) {
                                  case ConnectionState.none:
                                    return const Text("Awaiting Bids....");
                                  case ConnectionState.waiting:
                                    return const Text("Waiting....");
                                  case ConnectionState.active:
                                    return const Text("Connection");
                                  case ConnectionState.done:
                                    return issueSnapshot.hasData
                                        ? SizedBox(
                                            width: double.maxFinite,
                                            child: ListView(
                                              shrinkWrap: true,
                                              children: issueSnapshot.data!
                                                  .map<Widget>((e) =>
                                                      Text(e!.description))
                                                  .toList(),
                                            ),
                                          )
                                        : const Text("No Data");
                                }
                              },
                            ),
                          ),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            )
          : Row(
              children: [
                Text("Total Cost: "),
                Expanded(
                  child: TextField(),
                ),
              ],
            ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Save bills'),
        ),
      ],
    );
  }
}
