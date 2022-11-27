import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/stock_item.dart';
import 'package:sigma_app/src/server/repository.dart';

class InventoryBloc {
  final _repo = Repository();

  final BehaviorSubject<List<StockItem>> _stockItemsSubject =
      BehaviorSubject<List<StockItem>>();
  Stream<List<StockItem>> get stockItems => _stockItemsSubject.stream;
  Function(List<StockItem>) get changeStockItems => _stockItemsSubject.sink.add;

  // New Stock Item

  final BehaviorSubject<String> _itemNameSubject = BehaviorSubject<String>();
  Stream<String> get itemName => _itemNameSubject.stream;
  Function(String) get changeItemName => _itemNameSubject.sink.add;

  final BehaviorSubject<String> _quantitySubject = BehaviorSubject<String>();
  Stream<String> get quantity => _quantitySubject.stream;
  Function(String) get changequantity => _quantitySubject.sink.add;

  final BehaviorSubject<String> _itemUnitPriceSubject =
      BehaviorSubject<String>();
  Stream<String> get itemUnitPrice => _itemUnitPriceSubject.stream;
  Function(String) get changeitemUnitPrice => _itemUnitPriceSubject.sink.add;

  final BehaviorSubject<String> _itemPhotoUriSubject =
      BehaviorSubject<String>();
  Stream<String> get itemPhotoUri => _itemPhotoUriSubject.stream;
  Function(String) get changeitemPhotoUri => _itemPhotoUriSubject.sink.add;

  void dispose() {}

  void createStockItem() {
    final userID = LoginBloc.instance.loggedUser!.id;
    final newStockItem = StockItem(
      (sI) => sI
        ..center_id = "01"
        ..created_at = DateTime.now().toString()
        ..created_by = userID
        ..item_name = _itemNameSubject.value
        ..item_photo_uri = _itemPhotoUriSubject.value
        ..quantity = int.parse(_quantitySubject.value)
        ..unit_price = double.parse(_itemUnitPriceSubject.value),
    );
    _repo.postStockItem(newStockItem).listen((newItem_stock) {});
  }
}
