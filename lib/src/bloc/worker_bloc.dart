import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/worker.dart';
import 'package:sigma_app/src/server/repository.dart';

class WorkerBloc {
  final _repo = Repository();

  final BehaviorSubject<List<Worker>> _workersSubject =
      BehaviorSubject<List<Worker>>();
  Stream<List<Worker>> get workers => _workersSubject.stream;
  Function(List<Worker>) get changeWorkers => _workersSubject.sink.add;

  void dispose() {
    _workersSubject.close();
  }

  void getWorkers() {
    final center_id = LoginBloc.instance.loggedUser!.center_id;
    _repo.fetchWorkers(center_id).listen((workers) {
      changeWorkers(workers);
    });
  }
}
