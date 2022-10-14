import 'package:flutter/material.dart';
import 'package:sigma_app/src/screen/customer_detail_screen.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    Key? key,
    required this.customerName,
  }) : super(key: key);
  final String customerName;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Text(
          customerName,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerDetailScreen(
                customerName: customerName,
              ),
            ),
          );
        },
      ),
    );
  }
}
