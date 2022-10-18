import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/server/repository.dart';

class AccountBloc {
  final _repo = Repository();

  final BehaviorSubject<List<Transaction>> _transactionsSubject =
      BehaviorSubject<List<Transaction>>();
  Stream<List<Transaction>> get transactions => _transactionsSubject.stream;
  Function(List<Transaction>) get changeTransactions =>
      _transactionsSubject.sink.add;

  void dispose() {
    _transactionsSubject.close();
  }

  void getTransactions() {
    _repo.fetchTransactions().listen((transactions) {
      changeTransactions(transactions);
    });
  }
}
