import 'package:flutter/material.dart';
import 'package:sigma_app/src/widgets/customer_card.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Tickets"),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 200,
              itemBuilder: (context, index) => CustomerCard(
                customerName: "Customer $index",
              ),
            ),
          )
        ],
      ),
    );
  }
}
