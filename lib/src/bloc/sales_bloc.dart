import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/models/sales.dart';

class SalesBloc {
  final BehaviorSubject<List<Sales>> _salesSubject =
      BehaviorSubject<List<Sales>>();
  Stream<List<Sales>> get sales => _salesSubject.stream;
  Function(List<Sales>) get changeSales => _salesSubject.sink.add;

  // New Sale
  final BehaviorSubject<String> _amountSubject = BehaviorSubject<String>();
  Stream<String> get amount => _amountSubject.stream;
  Function(String) get changeAmount => _amountSubject.sink.add;

  final BehaviorSubject<String> _customerNameSubject =
      BehaviorSubject<String>();
  Stream<String> get customerName => _customerNameSubject.stream;
  Function(String) get changeCustomerName => _customerNameSubject.sink.add;

  final BehaviorSubject<String> _customerAddressSubject =
      BehaviorSubject<String>();
  Stream<String> get customerAddress => _customerAddressSubject.stream;
  Function(String) get changeCustomerAddress =>
      _customerAddressSubject.sink.add;

  final BehaviorSubject<String> _customerNumberSubject =
      BehaviorSubject<String>();
  Stream<String> get customerNumber => _customerNumberSubject.stream;
  Function(String) get changeCustomerNumber => _customerNumberSubject.sink.add;
}
