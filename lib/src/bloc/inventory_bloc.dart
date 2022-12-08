import 'package:file_selector/file_selector.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/login_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/sales.dart';
import 'package:sigma_app/src/models/sales_item.dart';
import 'package:sigma_app/src/models/stock_item.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/server/repository.dart';

class InventoryBloc {
  final _repo = Repository();

  final BehaviorSubject<List<StockItem>> _stockItemsSubject =
      BehaviorSubject<List<StockItem>>();
  Stream<List<StockItem>> get stockItems => _stockItemsSubject.stream;
  Function(List<StockItem>) get changeStockItems => _stockItemsSubject.sink.add;

  final BehaviorSubject<List<Sales>> _salesSubject =
      BehaviorSubject<List<Sales>>();
  Stream<List<Sales>> get sales => _salesSubject.stream;
  Function(List<Sales>) get changeSales => _salesSubject.sink.add;

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

  final BehaviorSubject<XFile> _itemPhotoSubject = BehaviorSubject<XFile>();
  Stream<XFile> get itemPhoto => _itemPhotoSubject.stream;
  Function(XFile) get changeItemPhoto => _itemPhotoSubject.sink.add;

  // New Sales

  final BehaviorSubject<StockItem> _currentlySelectedSISubject =
      BehaviorSubject<StockItem>();
  Stream<StockItem> get currentlySelectedSI =>
      _currentlySelectedSISubject.stream;
  Function(StockItem) get changeCurrentlySelectedSI =>
      _currentlySelectedSISubject.sink.add;

  final BehaviorSubject<String> _currentSIQuantitySubject =
      BehaviorSubject<String>();
  Stream<String> get currentSIQuantity => _currentSIQuantitySubject.stream;
  Function(String) get changecurrentSIQuantity =>
      _currentSIQuantitySubject.sink.add;

  final BehaviorSubject<List<SalesItem>> _currentSalesItemsSubject =
      BehaviorSubject<List<SalesItem>>();
  Stream<List<SalesItem>> get currentSalesItems =>
      _currentSalesItemsSubject.stream;
  Function(List<SalesItem>) get changeCurrentSalesItems =>
      _currentSalesItemsSubject.sink.add;

  final BehaviorSubject<String> _paymentMethodSubject =
      BehaviorSubject<String>();
  Stream<String> get paymentMethod => _paymentMethodSubject.stream;
  Function(String) get changePaymentMethod => _paymentMethodSubject.sink.add;

  final BehaviorSubject<String> _customerNameSubject =
      BehaviorSubject<String>();
  Stream<String> get customerName => _customerNameSubject.stream;
  Function(String) get changeCustomerName => _customerNameSubject.sink.add;

  final BehaviorSubject<String> _customerAddressSubject =
      BehaviorSubject<String>();
  Stream<String> get customerAddress => _customerAddressSubject.stream;
  Function(String) get changeCustomerAddress =>
      _customerAddressSubject.sink.add;

  final BehaviorSubject<String> _customerPhoneSubject =
      BehaviorSubject<String>();
  Stream<String> get customerPhone => _customerPhoneSubject.stream;
  Function(String) get changecustomerPhone => _customerPhoneSubject.sink.add;

  List<SalesItem> _currentSalesItemsList = [];

  InventoryBloc() {
    changePaymentMethod("cash");
  }

  void dispose() {}

  void getSales() {
    _repo.fetchSales().listen((sales) {
      changeSales(sales);
    });
  }

  void createSales() {
    final userID = LoginBloc.instance.loggedUser!.id;

    final newSalesItem = _currentSalesItemsList;

    final newCustomer = Customer(
      (c) => (c)
        ..address = _customerAddressSubject.value
        ..name = _customerNameSubject.value
        ..ph_number = int.parse(
          _customerPhoneSubject.value,
        ),
    );

    final newSale = Sales(
      (s) => (s)
        ..center_id = "01"
        ..created_at = DateTime.now().toString()
        ..created_by = userID
        ..item_count = 1
        ..amount = _currentSalesItemsList.fold(
          0,
          (previousValue, element) => previousValue! + element.total,
        )
        ..payment_method = _paymentMethodSubject.value,
    );

    _repo
        .postSales(
      newSale,
      newCustomer,
      newSalesItem,
    )
        .listen((sale) {
      _repo
          .postTransaction(Transaction.parseJsonToTransaction(
              Sales.parseSalesToTransactionJson(sale)))
          .listen((event) {});
    });
  }

  void addSalesItems() {
    if (_currentSalesItemsList == [] ||
        !_currentSalesItemsList
            .map((e) => e.item_id)
            .toList()
            .contains(_currentlySelectedSISubject.value.id)) {
      final newStockItem = SalesItem.convertStockItemToSalesItem(
        _currentlySelectedSISubject.value,
        int.parse(_currentSIQuantitySubject.value),
      );
      _currentSalesItemsList.add(newStockItem);
      changeCurrentSalesItems(_currentSalesItemsList);
    }
  }

  void removeSalesItem(int index) {
    final _currentItems = _currentSalesItemsSubject.value;
    _currentItems.removeAt(index);
    _currentSalesItemsList = _currentItems;
    changeCurrentSalesItems(_currentItems);
  }

  void getStockItems() {
    _repo.fetchStock().listen((stockItems) {
      changeStockItems(stockItems!);
    });
  }

  void choosePhoto() async {
    const XTypeGroup typeGroup = XTypeGroup(
      label: 'images',
      extensions: <String>['jpg', 'png'],
    );
    final XFile? file =
        await openFile(acceptedTypeGroups: <XTypeGroup>[typeGroup]);
    changeItemPhoto(file!);
  }

  void createStockItem() {
    final userID = LoginBloc.instance.loggedUser!.id;

    _repo.postStockItemPhoto(_itemPhotoSubject.value).listen((imageJson) {
      if (imageJson['image_path'] != "") {
        final newStockItem = StockItem(
          (sI) => sI
            ..center_id = "01"
            ..created_at = DateTime.now().toString()
            ..created_by = userID
            ..item_name = _itemNameSubject.value
            ..item_photo_uri = imageJson['image_path']
            ..quantity = int.parse(_quantitySubject.value)
            ..unit_price = double.parse(_itemUnitPriceSubject.value),
        );
        _repo.postStockItem(newStockItem).listen((newItem_stock) {});
      } else {
        print("Photo not uploaded");
      }
    });
  }
}
