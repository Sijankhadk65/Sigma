import 'package:flutter/material.dart';

class CustomerDetailScreen extends StatefulWidget {
  const CustomerDetailScreen({
    Key? key,
    required this.customerName,
  }) : super(key: key);
  final String customerName;

  @override
  State<CustomerDetailScreen> createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            widget.customerName,
          ),
        ),
      ),
    );
  }
}
