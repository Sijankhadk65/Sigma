import 'package:rxdart/rxdart.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/worker.dart';
import 'package:sigma_app/src/server/repository.dart';

import '../models/issue.dart';

class TicketBloc {
  final _repo = Repository();

  final BehaviorSubject<List<Ticket?>> _ticketsSubject =
      BehaviorSubject<List<Ticket?>>();
  Stream<List<Ticket?>> get tickets => _ticketsSubject.stream;
  Function(List<Ticket?>) get changeTickets => _ticketsSubject.sink.add;

  final BehaviorSubject<Ticket?> _ticketSubject = BehaviorSubject<Ticket?>();
  Stream<Ticket?> get ticket => _ticketSubject.stream;
  Function(Ticket?) get changeTicket => _ticketSubject.sink.add;

  final BehaviorSubject<bool> _isSavingSubject = BehaviorSubject<bool>();
  Stream<bool> get isSaving => _isSavingSubject.stream;
  Function(bool) get changeIsSaving => _isSavingSubject.sink.add;

  // New Ticket Info
  final BehaviorSubject<String> _customerNameSubject =
      BehaviorSubject<String>();
  Stream<String> get customerName => _customerNameSubject.stream;
  Function(String) get changeCustomerName => _customerNameSubject.sink.add;

  final BehaviorSubject<String> _customerPhoneSubject =
      BehaviorSubject<String>();
  Stream<String> get customerPhone => _customerPhoneSubject.stream;
  Function(String) get changeCustomerPhone => _customerPhoneSubject.sink.add;

  final BehaviorSubject<String> _customerAddressSubject =
      BehaviorSubject<String>();
  Stream<String> get customerAddress => _customerAddressSubject.stream;
  Function(String) get changeCustomerAddress =>
      _customerAddressSubject.sink.add;

  final BehaviorSubject<DateTime?> _openedDateSubject =
      BehaviorSubject<DateTime?>();
  Stream<DateTime?> get openedDate => _openedDateSubject.stream;
  Function(DateTime?) get changeOpenedDate => _openedDateSubject.sink.add;

  final BehaviorSubject<DateTime?> _deliveryDateSubject =
      BehaviorSubject<DateTime?>();
  Stream<DateTime?> get deliveryDate => _deliveryDateSubject.stream;
  Function(DateTime?) get changeDeliveryDate => _deliveryDateSubject.sink.add;

  final BehaviorSubject<String> _deliveryAddressSubject =
      BehaviorSubject<String>();
  Stream<String> get deliveryAddress => _deliveryAddressSubject.stream;
  Function(String) get changeDeliveryAddress =>
      _deliveryAddressSubject.sink.add;

  final BehaviorSubject<String> _issueDescriptionSubject =
      BehaviorSubject<String>();
  Stream<String> get issueDescription => _issueDescriptionSubject.stream;
  Function(String) get changeIssueDescription =>
      _issueDescriptionSubject.sink.add;

  final BehaviorSubject<String> _totalCostSubject = BehaviorSubject<String>();
  Stream<String> get totalCost => _totalCostSubject.stream;
  Function(String) get changeTotalCost => _totalCostSubject.sink.add;

  //Device info
  final BehaviorSubject<String> _deviceManufacturerSubject =
      BehaviorSubject<String>();
  Stream<String> get deviceManufacturer => _deviceManufacturerSubject.stream;
  Function(String) get changeDeviceManufacturer =>
      _deviceManufacturerSubject.sink.add;

  final BehaviorSubject<String> _deviceModelSubject = BehaviorSubject<String>();
  Stream<String> get deviceModel => _deviceModelSubject.stream;
  Function(String) get changeDeviceModel => _deviceModelSubject.sink.add;

  //Issue
  final BehaviorSubject<List<Issue?>> _ticketIssuesSubject =
      BehaviorSubject<List<Issue?>>();
  Stream<List<Issue?>> get ticketIssues => _ticketIssuesSubject.stream;
  Function(List<Issue?>) get changeTicketIssues =>
      _ticketIssuesSubject.sink.add;

  // Worker
  final BehaviorSubject<Worker?> _ticketWorkerSubject =
      BehaviorSubject<Worker?>();
  Stream<Worker?> get ticketWorker => _ticketWorkerSubject.stream;
  Function(Worker?) get changeTicketWorker => _ticketWorkerSubject.sink.add;

  final BehaviorSubject<Worker> _currentWorkerSubject =
      BehaviorSubject<Worker>();
  Stream<Worker> get currentWorker => _currentWorkerSubject.stream;
  Function(Worker) get changeCurrentWorker => _currentWorkerSubject.sink.add;

  List<Issue> newIssues = [];

  TicketBloc() {
    changeIsSaving(false);
    // changeCustomerName("");
    // changeCustomerPhone("");
    // changeCustomerAddress("");
    changeOpenedDate(DateTime.now());
    changeDeliveryDate(DateTime.now());
    changeDeliveryAddress("");
    changeIssueDescription("");
    // changeTotalCost("");
    changeTicketIssues([]);
  }

  void dispose() {
    _ticketsSubject.close();
    _ticketSubject.close();
    _isSavingSubject.close();
    _customerNameSubject.close();
  }

  void getTickets() {
    _repo.fetchTickets().listen((tickets) {
      changeTickets(tickets);
    });
  }

  void getTicket(String id) {
    _repo.fetchTicket(id).listen((ticket) {
      changeTicket(ticket);
    });
  }

  void getTicketIssues(String ticketID) {
    _repo.fetchIssues(ticketID).listen((issues) {
      changeTicketIssues(issues);
    });
  }

  void getTicketWorker(String id) {
    _repo.fetchWorker(id).listen((worker) {
      changeTicketWorker(worker);
    });
  }

  void updateTicketWorker(String? ticketID) {
    _updateTicket(
      {
        "param": {
          "serviced_by": _ticketWorkerSubject.value!.id,
        }
      },
      ticketID,
    );
  }

  void updateTicketPaidStatus(String? ticketID) {
    _updateTicket({
      "param": {
        "is_payment_due": 0,
      }
    }, ticketID);
  }

  void _updateTicket(Map<String, dynamic> updateParams, String? ticketID) {
    _repo.updateTicket(updateParams, ticketID!).listen((ticket) {
      changeTicket(ticket);
    });
  }

  void saveTicket() {
    changeIsSaving(true);
    final newCustomer = Customer(
      (c) => c
        ..name = _customerNameSubject.value
        ..address = _customerAddressSubject.value
        ..ph_number = int.parse(_customerPhoneSubject.value),
    );
    final newTicket = Ticket(
      (t) => t
        ..center_id = 1
        ..closed_at = null
        ..closed_by = null
        ..customer_id = null
        ..pay_recieved_by = null
        ..paid_at = null
        ..closed_issue = 0
        ..is_closed = 0
        ..is_payment_due = 1
        ..issue_count = _ticketIssuesSubject.value.length
        ..open_issue = _ticketIssuesSubject.value.length
        ..opened_at = _openedDateSubject.value.toString()
        ..opened_by = "002esrrr"
        ..serviced_by = null
        ..device_manufacturer = _deviceManufacturerSubject.value
        ..device_model = _deviceModelSubject.value
        ..total_service_cost = null,
    );
    _repo.postTicket(newTicket, newIssues, newCustomer).listen(
      (ticket) {
        if (ticket != null) {
          changeIsSaving(false);
        }
      },
    );
  }

  void deleteTicket(String ticketID) {
    _repo.deleteTicket(ticketID).listen((response) {
      if (response['status'] == 1) {
        getTickets();
      } else {
        print("Delete not successful");
      }
    });
  }

  void addNewIssue() {
    final newIssue = Issue(
      (i) => i
        ..created_at = DateTime.now().toString()
        ..description = _issueDescriptionSubject.value
        ..is_closed = 0,
    );
    newIssues.add(newIssue);
    changeTicketIssues(newIssues);
  }

  void removeIssue(int index) {
    final currentIssues = _ticketIssuesSubject.value;
    currentIssues.removeAt(index);
    changeTicketIssues(currentIssues);
  }

  Stream<Customer?> getTicketCustomer(String id) {
    return _repo.fetchCustomer(id);
  }
}
