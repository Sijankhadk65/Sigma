import 'package:rxdart/rxdart.dart';
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
    _repo.fetchWorkers().listen((workers) {
      changeWorkers(workers);
    });
  }
}
