import 'package:flutter/material.dart';

class WorkerDetailScreen extends StatefulWidget {
  const WorkerDetailScreen({
    Key? key,
    required this.workerName,
  }) : super(key: key);
  final String workerName;

  @override
  State<WorkerDetailScreen> createState() => _WorkerDetailScreenState();
}

class _WorkerDetailScreenState extends State<WorkerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text(
            widget.workerName,
          ),
        ),
      ),
    );
  }
}
