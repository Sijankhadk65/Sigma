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

  TextEditingController? _customerNameController;
  TextEditingController? _customerAddressController;
  TextEditingController? _customerPhoneController;
  TextEditingController? _deviceManufracturerController;
  TextEditingController? _deviceModelController;

  @override
  void initState() {
    super.initState();
    _customerNameController = TextEditingController();
    _customerAddressController = TextEditingController();
    _customerPhoneController = TextEditingController();
    _deviceManufracturerController = TextEditingController();
    _deviceModelController = TextEditingController();
  }

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
              controllers: [
                _deviceManufracturerController!,
                _deviceModelController!,
                _customerPhoneController!,
                _customerNameController!,
                _customerAddressController!,
              ],
              ticketBloc: _ticketBloc,
            ),
          ),
          const SizedBox(
            width: 100,
          ),
          Expanded(
            flex: 2,
            child: TicketSummary(
              controllers: [
                _deviceManufracturerController!,
                _deviceModelController!,
                _customerNameController!,
                _customerPhoneController!,
                _customerAddressController!,
              ],
              ticketBloc: _ticketBloc,
            ),
          )
        ],
      ),
    );
  }
}
