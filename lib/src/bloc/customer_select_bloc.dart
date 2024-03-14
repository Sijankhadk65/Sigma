import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/bloc/customer_bloc.dart';
import 'package:sigma_app/src/bloc/ticket_bloc.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/server/repository.dart';

class CustomerSelectBloc {
  final _repo = Repository();

  final BehaviorSubject<String?> _searchTermSubject =
      BehaviorSubject<String?>();
  Stream<String?> get searchTerm => _searchTermSubject.stream;
  Function(String?) get changeSearchTerm => _searchTermSubject.sink.add;

  final BehaviorSubject<List<Customer>> _reuqestedCustomerListSubject =
      BehaviorSubject<List<Customer>>();
  Stream<List<Customer>> get reuqestedCustomerList =>
      _reuqestedCustomerListSubject.stream;
  Function(List<Customer>) get changeReuqestedCustomerList =>
      _reuqestedCustomerListSubject.sink.add;

  final BehaviorSubject<Customer?> _selectedCustomerSubject =
      BehaviorSubject<Customer?>();
  Stream<Customer?> get selectedCustomer => _selectedCustomerSubject.stream;
  Function(Customer?) get changeSelectedCustomer =>
      _selectedCustomerSubject.sink.add;

  List<Customer> _requestedCustomers = [];

  CustomerSelectBloc() {
    changeSearchTerm("");
  }

  void getCustomerList() {
    _repo
        .fetchCustomers(
            _searchTermSubject.value == "" ? null : _searchTermSubject.value)
        .listen((customers) {
      _requestedCustomers = customers;
      changeReuqestedCustomerList(customers);
    });
  }

  void changeCustomer(String id) {
    changeSelectedCustomer(
      _requestedCustomers.where((element) => element.id == id).first,
    );
  }

  void passSelectedCustomer(
      TicketBloc bloc, List<TextEditingController> controllers) {
    bloc.changeCustomerName(_selectedCustomerSubject.value!.name);
    bloc.changeCustomerAddress(_selectedCustomerSubject.value!.address);
    bloc.changeCustomerPhone(
      _selectedCustomerSubject.value!.ph_number.toString(),
    );
    controllers[0].text = _selectedCustomerSubject.value!.ph_number.toString();
    controllers[1].text = _selectedCustomerSubject.value!.name;
    controllers[2].text = _selectedCustomerSubject.value!.address;
    bloc.setCustomerID(_selectedCustomerSubject.value!.id!);
  }
}
