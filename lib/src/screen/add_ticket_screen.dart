import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/issue.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/server/repository.dart';
import 'package:sigma_app/src/widgets/ticket_sumary.dart';
import 'package:web_date_picker/web_date_picker.dart';

import '../widgets/ticket_input_form.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({Key? key}) : super(key: key);

  @override
  State<AddTicketScreen> createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
  // final newTicket = Ticket(
  //   (t) => t
  //     ..center_id = 1
  //     ..closed_at = "2022-08-17 13:47:46"
  //     ..closed_by = null
  //     ..closed_issue = 0
  //     ..is_closed = 0
  //     ..is_payment_due = 1
  //     ..issue_count = 1
  //     ..open_issue = 1
  //     ..opened_at = "2022-08-17 13:47:46"
  //     ..opened_by = "9982001"
  //     ..serviced_by = null
  //     ..total_service_cost = 100,
  // );
  // final newIssues = <Issue>[
  //   Issue(
  //     (i) => i
  //       ..created_at = "2022-08-17 13:47:46"
  //       ..description = "asdasda"
  //       ..is_closed = 0,
  //   ),
  // ];

  TicketBloc? _ticketBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _ticketBloc = Provider.of<TicketBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: TicketInputForm(
              ticketBloc: _ticketBloc,
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Expanded(
            flex: 2,
            child: TicketSummary(
              ticketBloc: _ticketBloc,
            ),
          )
        ],
      ),

      // StreamBuilder<bool>(
      //   stream: _ticketBloc!.isSaving,
      //   builder: (context, snapshot) {
      //     return snapshot.data == false
      //         ? ElevatedButton(
      //             onPressed: () {
      //               _ticketBloc!.saveTicket();
      //             },
      //             child: const Text("Save Ticket"),
      //           )
      //         : const CircularProgressIndicator();
      //   },
      // ),
    );
  }
}
