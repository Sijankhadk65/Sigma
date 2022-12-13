import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/models/page.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/server/repository.dart';

class PaginatorBloc {
  final _repo = Repository();

  final BehaviorSubject<Page<Ticket>> _ticketPageSubject =
      BehaviorSubject<Page<Ticket>>();
  Stream<Page<Ticket>> get ticketPage => _ticketPageSubject.stream;
  Function(Page<Ticket>) get changeTicketPage => _ticketPageSubject.sink.add;

  final BehaviorSubject<Page<Transaction>> _transactionPageSubject =
      BehaviorSubject<Page<Transaction>>();
  Stream<Page<Transaction>> get transactionPage =>
      _transactionPageSubject.stream;
  Function(Page<Transaction>) get changeTransactionPage =>
      _transactionPageSubject.sink.add;

  void getTicketPage() {}
}
