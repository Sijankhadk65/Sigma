import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigma_app/src/bloc/worker_bloc.dart';
import 'package:sigma_app/src/models/worker.dart';

import '../widgets/worker_card.dart';

class WorkerScreen extends StatefulWidget {
  const WorkerScreen({Key? key}) : super(key: key);

  @override
  State<WorkerScreen> createState() => _WorkerScreenState();
}

class _WorkerScreenState extends State<WorkerScreen> {
  WorkerBloc? _workerBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _workerBloc = Provider.of<WorkerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    _workerBloc!.getWorkers();
    return Container(
      child: Column(
        children: [
          Text("Tickets"),
          Expanded(
            child: StreamBuilder<List<Worker>>(
              stream: _workerBloc!.workers,
              builder: (context, snapshot) {
                return Text(snapshot.data.toString());
                // return ListView.builder(
                //   shrinkWrap: true,
                //   itemCount: 200,
                //   itemBuilder: (context, index) => WorkerCard(
                //     workerName: "Worker #$index",
                //   ),
                // );
              },
            ),
          )
        ],
      ),
    );
  }
}
