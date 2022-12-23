import 'dart:convert';
import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/expense.dart';
import 'package:sigma_app/src/models/sales.dart';
import 'package:sigma_app/src/models/sales_item.dart';
import 'package:sigma_app/src/models/stock_item.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/transaction.dart';

import '../models/issue.dart';

class HttpProvider {
  final HttpClient _client;

  HttpProvider._(this._client);

  final hostName = "http://localhost:8000";

  static final instance = HttpProvider._(HttpClient());

  Future<HttpClientResponse> fetchTickets(
    List<String> filters,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/ticket/filter"),
    );

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchTicket(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/ticket/$id"),
    );

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchIssues(
    String? ticketID,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/issue/$ticketID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchExpenses(
    String? ticketID,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/expense/$ticketID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postExpense(Expense expense) async {
    Map<String, dynamic> body = {
      "param": {
        "expense": Expense.parseExpenseToJson(expense),
      }
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/expense/create"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future deleteExpense(String expenseID) async {
    HttpClientRequest _request = await _client.deleteUrl(
      Uri.parse("$hostName/expense/delete/$expenseID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postTicket(
    Ticket? ticket,
    List<Issue?> issues,
  ) async {
    final _ticket = Ticket.parseToJson(ticket);
    final _issues = issues.map((issue) => Issue.parseToJson(issue)).toList();

    Map<String, dynamic> body = {
      "param": {
        "ticket": _ticket,
        "issues": _issues,
      }
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/ticket/create"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postCustomer(
    Customer customer,
  ) async {
    final _customer = Customer.parseCustomerToJson(customer);

    Map<String, dynamic> body = {
      "param": {
        "customer": _customer,
      }
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/customer/create"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> updateTicket(
    Map<String, dynamic> updateParams,
    String ticketID,
  ) async {
    Map<String, dynamic> body = updateParams;
    HttpClientRequest _request = await _client.putUrl(
      Uri.parse("$hostName/ticket/update/$ticketID"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future deleteTicket(String ticketID) async {
    HttpClientRequest _request = await _client.deleteUrl(
      Uri.parse("$hostName/ticket/delete/$ticketID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchCustomers(String? name) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse(
        name == null ? "$hostName/customer" : "$hostName/customer/search/$name",
      ),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchCustomer(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/customer/id/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchCustomerFromNumber(
    String num,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/customer/num/$num"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchCenterWorker(
    String? center_id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/worker/center/$center_id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchWorker(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/worker/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchWorkers() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/worker"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postTransaction(
      Transaction ticketTransaction) async {
    Map<String, dynamic> body = {
      "param": {
        "transaction": Transaction.parseTransactionToJson(ticketTransaction),
      }
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/accounting/transaction/create"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchTransactions() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/accounting/transaction"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> login(
    String username,
    String password,
  ) async {
    Map<String, dynamic> body = {
      "username": username,
      "password": password,
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/user/authenticate"),
    );

    _request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");
    _request.write(json.encode(body));
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchSales() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/inventory/sales/01"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postStockItemPhoto(XFile photoFile) async {
    List<int> byteFile = await photoFile.readAsBytes();
    Map<String, dynamic> body = {
      "param": {
        "image": base64Encode(byteFile),
        "imageName": photoFile.name,
      }
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/inventory/stock/createItemPhoto"),
    );

    _request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");

    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postStockItem(StockItem newStockItem) async {
    Map<String, dynamic> body = {
      "param": {
        "stockItem": StockItem.parseStockItemToJson(newStockItem),
      }
    };

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/inventory/stock/createItem"),
    );

    _request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");

    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> updateStockItem(
    Map<String, dynamic> updateParams,
    String itemID,
  ) async {
    HttpClientRequest _request = await _client.putUrl(
      Uri.parse("$hostName/inventory/stock/updateItem/$itemID"),
    );

    _request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");

    _request.write(json.encode(updateParams));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchStock() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$hostName/inventory/stock/getItems/01"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postSales(
    Sales newSale,
    List<SalesItem> salesItems,
    Customer customer,
  ) async {
    Map<String, dynamic> body = {
      "param": {
        "customer": Customer.parseCustomerToJson(customer),
        "sales": Sales.parseSalesToJson(newSale),
        "salesItems": salesItems
            .map(
              (item) => SalesItem.parseExpenseToJson(item),
            )
            .toList(),
      }
    };

    print(body);

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$hostName/inventory/sales/create"),
    );

    _request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");

    _request.write(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }
}
