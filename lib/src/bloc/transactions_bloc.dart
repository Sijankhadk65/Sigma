import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/server/repository.dart';

class TransactionsBloc {
  final _repo = Repository();

  final BehaviorSubject<List<Transaction>> _transactionsSubject =
      BehaviorSubject<List<Transaction>>();
  Stream<List<Transaction>> get transactions => _transactionsSubject.stream;
  Function(List<Transaction>) get changeTransactions =>
      _transactionsSubject.sink.add;

  // New Transactions
  final BehaviorSubject<String> _transactionDescriptionSubject =
      BehaviorSubject<String>();
  Stream<String> get transactionDescription =>
      _transactionDescriptionSubject.stream;
  Function(String) get changeTransactionDescription =>
      _transactionDescriptionSubject.sink.add;

  final BehaviorSubject<String> _transactionAmountSubject =
      BehaviorSubject<String>();
  Stream<String> get transactionAmount => _transactionAmountSubject.stream;
  Function(String) get changeTransactionAmount =>
      _transactionAmountSubject.sink.add;

  final BehaviorSubject<String> _transactionTypeSubject =
      BehaviorSubject<String>();
  Stream<String> get transactionType => _transactionTypeSubject.stream;
  Function(String) get changeTransactionType =>
      _transactionTypeSubject.sink.add;

  final BehaviorSubject<String> _transactionSourceSubject =
      BehaviorSubject<String>();
  Stream<String> get transactionSource => _transactionSourceSubject.stream;
  Function(String) get changeTransactionSource =>
      _transactionSourceSubject.sink.add;

  final BehaviorSubject<String> _paymentTypeSubject = BehaviorSubject<String>();
  Stream<String> get paymentType => _paymentTypeSubject.stream;
  Function(String) get changePaymentType => _paymentTypeSubject.sink.add;

  final BehaviorSubject<bool> _isSavingSubject = BehaviorSubject<bool>();
  Stream<bool> get isSaving => _isSavingSubject.stream;
  Function(bool) get changeIsSaving => _isSavingSubject.sink.add;

  TransactionsBloc() {
    changeIsSaving(false);
  }

  void getTransactions() {
    _repo.fetchTransactions().listen((transactions) {
      changeTransactions(transactions);
    });
  }

  void createNewTransaction() {
    final userID = LoginBloc.instance.loggedUser!.id;
    final newTransaction = Transaction(
      (t) => t
        ..amount = double.parse(_transactionAmountSubject.value)
        ..center_id = "01"
        ..created_by = userID
        ..created_at = DateTime.now().toString()
        ..description = _transactionDescriptionSubject.value
        ..payment_method = _paymentTypeSubject.value
        ..source = _transactionSourceSubject.value
        ..transaction_at = DateTime.now().toString()
        ..type = _transactionTypeSubject.value,
    );
    changeIsSaving(true);
    _repo.postTransaction(newTransaction).listen((event) {
      changeIsSaving(false);
    });
  }

  void dispose() {
    _transactionsSubject.close();
  }
}
