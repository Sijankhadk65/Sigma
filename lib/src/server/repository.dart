import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/expense.dart';
import 'package:sigma_app/src/models/issue.dart';
import 'package:sigma_app/src/models/page.dart';
import 'package:sigma_app/src/models/sales.dart';
import 'package:sigma_app/src/models/sales_item.dart';
import 'package:sigma_app/src/models/stock_item.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/models/user.dart';
import 'package:sigma_app/src/models/worker.dart';
import 'package:sigma_app/src/server/http_provider.dart';

class Repository {
  final HttpProvider _provider = HttpProvider.instance;

  Stream<Page<Ticket>> fetchTickets() async* {
    final response = await _provider.fetchTickets();
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Page<Ticket>>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> pageMap =
            jsonDecode(data)['data']['original'];
        final page = Page.parseJsonToPage(pageMap);
        sink.add(page);
      },
    ));
  }

  Stream<Ticket?> fetchTicket(String? id) async* {
    final response = await _provider.fetchTicket(id);
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Ticket?>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> ticket =
            jsonDecode(data)['data']['original'][0];
        sink.add(Ticket.parseToTicket(ticket));
      },
    ));
  }

  Stream<List<Issue?>> fetchIssues(String? ticketID) async* {
    final response = await _provider.fetchIssues(ticketID);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, List<Issue?>>.fromHandlers(
        handleData: (data, sink) {
          final List<dynamic> issues = jsonDecode(data)['data']['original'];
          List<Issue?> sinkData = [];
          if (issues != []) {
            for (var issue in issues) {
              sinkData.add(Issue.parseToIssue(issue));
            }
          } else {}
          sink.add(sinkData);
        },
      ),
    );
  }

  Stream<List<Expense?>> fetchExpenses(String? ticketID) async* {
    final response = await _provider.fetchExpenses(ticketID);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, List<Expense?>>.fromHandlers(
        handleData: (data, sink) {
          final List<dynamic> expenses = jsonDecode(data)['data']['original'];
          List<Expense?> sinkData = [];
          if (expenses != []) {
            for (var expense in expenses) {
              sinkData.add(Expense.parseJsonToExpense(expense));
            }
          } else {}
          sink.add(sinkData);
        },
      ),
    );
  }

  Stream<Expense?> postExpense(Expense expense) async* {
    final response = await _provider.postExpense(expense);
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Expense?>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> ticket =
            jsonDecode(data)['data']['original'];
        sink.add(Expense.parseJsonToExpense(ticket));
      },
    ));
  }

  Stream<Map<String, dynamic>> deleteExpense(String expenseID) async* {
    final response = await _provider.deleteExpense(
      expenseID,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Map<String, dynamic>>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> response = jsonDecode(data);
        sink.add(response);
      },
    ));
  }

  Stream<Ticket?> postTicket(
    Ticket? newTicket,
    List<Issue?> newIssues,
  ) async* {
    final response = await _provider.postTicket(
      newTicket,
      newIssues,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Ticket?>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> ticket = jsonDecode(data);
        sink.add(Ticket.parseToTicket(ticket));
      },
    ));
  }

  Stream<Ticket?> updateTicket(
    Map<String, dynamic> updateParams,
    String? ticketID,
  ) async* {
    final response = await _provider.updateTicket(
      updateParams,
      ticketID!,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Ticket?>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> ticket = jsonDecode(data);
        sink.add(Ticket.parseToTicket(ticket));
      },
    ));
  }

  Stream<Map<String, dynamic>> deleteTicket(String ticketID) async* {
    final response = await _provider.deleteTicket(
      ticketID,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Map<String, dynamic>>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> response = jsonDecode(data);
        sink.add(response);
      },
    ));
  }

  Stream<Customer?> fetchCustomer(String? id) async* {
    final response = await _provider.fetchCustomer(id);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, Customer?>.fromHandlers(
        handleData: (data, sink) {
          final Map<String, dynamic> customer =
              jsonDecode(data)['data']['original'];
          sink.add(Customer.parseJsonToCustomer(customer));
        },
      ),
    );
  }

  Stream<Customer?> fetchCustomerFromNumber(String num) async* {
    final response = await _provider.fetchCustomerFromNumber(num);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, Customer?>.fromHandlers(
        handleData: (data, sink) {
          final Map<String, dynamic> customer =
              jsonDecode(data)['data']['original'][0];
          sink.add(Customer.parseJsonToCustomer(customer));
        },
      ),
    );
  }

  Future<Customer> postCustomer(
    Customer newCustomer,
  ) async {
    final HttpClientResponse response = await _provider.postCustomer(
      newCustomer,
    );
    final Map<String, dynamic> customerMap =
        jsonDecode(await response.transform(utf8.decoder).join());
    return Customer.parseJsonToCustomer(customerMap['data']['original']);
  }

  Stream<Worker?> fetchWorker(String? id) async* {
    final response = await _provider.fetchWorker(id);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, Worker?>.fromHandlers(
        handleData: (data, sink) {
          final Map<String, dynamic> worker =
              jsonDecode(data)['data']['original'];
          sink.add(Worker.parseJsonToWorker(worker));
        },
      ),
    );
  }

  Stream<List<Worker>> fetchWorkers($center_id) async* {
    final response = await _provider.fetchCenterWorker($center_id);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, List<Worker>>.fromHandlers(
        handleData: (data, sink) {
          final List<dynamic> workers = jsonDecode(data)['data']['original'];
          List<Worker> sinkData = [];
          for (var worker in workers) {
            sinkData.add(Worker.parseJsonToWorker(worker));
          }
          sink.add(sinkData);
        },
      ),
    );
  }

  Stream<Transaction> postTransaction(Transaction ticketTransaction) async* {
    final response = await _provider.postTransaction(
      ticketTransaction,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Transaction>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> newTransaction =
            jsonDecode(data)['data']['original'];
        sink.add(Transaction.parseJsonToTransaction(newTransaction));
      },
    ));
  }

  Stream<List<Transaction>> fetchTransactions() async* {
    final response = await _provider.fetchTransactions();
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, List<Transaction>>.fromHandlers(
        handleData: (data, sink) {
          final List<dynamic> expenses = jsonDecode(data)['data']['original'];
          List<Transaction> sinkData = [];
          for (var expense in expenses) {
            sinkData.add(Transaction.parseJsonToTransaction(expense));
          }
          sink.add(sinkData);
        },
      ),
    );
  }

  Stream<User?> login(String username, String password) async* {
    HttpClientResponse? response;
    String exception = "";
    try {
      response = await _provider.login(username, password);
    } on Exception {
      print("There has been an exception");
    }

    yield* utf8.decoder.bind(response!).transform(
      StreamTransformer<String, User?>.fromHandlers(
        handleData: (data, sink) {
          if (jsonDecode(data)['data']['exception'] == null) {
            final user = jsonDecode(data)['data']['original'];
            sink.add(User.parseJsonToUser(user));
          } else {
            sink.addError(jsonDecode(data)['data']['exception']);
            sink.add(null);
          }
        },
      ),
    );
  }

  Stream<List<Sales>> fetchSales() async* {
    final response = await _provider.fetchSales();
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, List<Sales>>.fromHandlers(
        handleData: (data, sink) {
          final List<dynamic> sales = jsonDecode(data)['data']['original'];
          List<Sales> sinkData = [];
          for (var sale in sales) {
            sinkData.add(Sales.parseJsonToSales(sale));
          }
          sink.add(sinkData);
        },
      ),
    );
  }

  Stream<Sales> postSales(
      Sales sales, Customer customer, List<SalesItem> items) async* {
    final response = await _provider.postSales(
      sales,
      items,
      customer,
    );
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, Sales>.fromHandlers(
        handleData: (data, sink) {
          final Map<String, dynamic> newStockItem =
              jsonDecode(data)['data']['original'];
          sink.add(
            Sales.parseJsonToSales(
              newStockItem,
            ),
          );
        },
      ),
    );
  }

  Stream<Map<String, dynamic>> postStockItemPhoto(XFile photoFile) async* {
    final response = await _provider.postStockItemPhoto(
      photoFile,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, Map<String, dynamic>>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> newStockItem =
            jsonDecode(data)['data']['original'];
        sink.add(
          newStockItem,
        );
      },
    ));
  }

  Stream<StockItem> postStockItem(StockItem stockItem) async* {
    final response = await _provider.postStockItem(
      stockItem,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, StockItem>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> newStockItem =
            jsonDecode(data)['data']['original'];
        sink.add(
          StockItem.parseJsonToStockItem(
            newStockItem,
          ),
        );
      },
    ));
  }

  Stream<List<StockItem>?> fetchStock() async* {
    final response = await _provider.fetchStock();
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, List<StockItem>?>.fromHandlers(
        handleData: (data, sink) {
          final List<dynamic> stockItems = jsonDecode(data)['data']['original'];
          List<StockItem> sinkData = [];
          if (stockItems != []) {
            for (var stockItem in stockItems) {
              sinkData.add(StockItem.parseJsonToStockItem(stockItem));
            }
            sink.add(sinkData);
          } else {
            sink.add(null);
          }
        },
      ),
    );
  }

  Stream<StockItem?> updateStockItem(
    Map<String, dynamic> updateParams,
    String? itemID,
  ) async* {
    final response = await _provider.updateStockItem(
      updateParams,
      itemID!,
    );
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, StockItem?>.fromHandlers(
      handleData: (data, sink) {
        final Map<String, dynamic> ticket = jsonDecode(data);
        sink.add(StockItem.parseJsonToStockItem(ticket));
      },
    ));
  }
}
