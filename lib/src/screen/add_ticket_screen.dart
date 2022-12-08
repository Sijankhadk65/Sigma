import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/widgets/ticket_sumary.dart';

import '../widgets/ticket_input_form.dart';

class AddTicketScreen extends StatefulWidget {
  const AddTicketScreen({Key? key}) : super(key: key);

  @override
  State<AddTicketScreen> createState() => _AddTicketScreenState();
}

class _AddTicketScreenState extends State<AddTicketScreen> {
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
    );
  }
}
