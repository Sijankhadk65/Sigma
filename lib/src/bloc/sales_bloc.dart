import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/sales.dart';
import 'package:sigma_app/src/models/sales_item.dart';
import 'package:sigma_app/src/server/repository.dart';

class SalesBloc {
  final _repo = Repository();

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

  void dispose() {}

  void createSales() {
    final userID = LoginBloc.instance.loggedUser!.id;

    final newSalesItem = SalesItem(
      (sI) => sI
        ..center_id = "01"
        ..created_at = DateTime.now().toString()
        ..item_id = "97d89e13-9a67-4042-988c-4f98c316cd33"
        ..item_name = "Monitor"
        ..item_photo_uri = "/photos/stock_items/27-inch-monitor-2048px-1572.jpg"
        ..quantity = 2
        ..total = 48000
        ..unit_price = 24000,
    );

    final newSale = Sales(
      (s) => (s)
        ..center_id = "01"
        ..created_at = DateTime.now().toString()
        ..created_by = userID
        ..item_count = 1
        ..amount = 1000,
    );
  }
}
