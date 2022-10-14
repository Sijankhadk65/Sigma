import 'package:flutter/material.dart';
import 'package:sigma_app/src/screen/customer_detail_screen.dart';
import 'package:sigma_app/src/screen/worker_detail_screen.dart';

class WorkerCard extends StatelessWidget {
  const WorkerCard({
    Key? key,
    required this.workerName,
  }) : super(key: key);
  final String workerName;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Text(
          workerName,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WorkerDetailScreen(
                workerName: workerName,
              ),
            ),
          );
        },
      ),
    );
  }
}
