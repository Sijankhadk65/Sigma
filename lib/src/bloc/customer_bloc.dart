import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/server/repository.dart';

class CustomerBloc {
  final _repo = Repository();

  final BehaviorSubject<List<Customer>> _customersSubject =
      BehaviorSubject<List<Customer>>();
  Stream<List<Customer>> get customers => _customersSubject.stream;
  Function(List<Customer>) get changeCustomers => _customersSubject.sink.add;

  void getCustomers() {
    _repo.fetchCustomers(null).listen((customers) {
      changeCustomers(customers);
    });
  }
}
