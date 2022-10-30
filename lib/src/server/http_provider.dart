import 'dart:convert';
import 'dart:io';

import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/ticket.dart';

import '../models/issue.dart';

class HttpProvider {
  final HttpClient _client;

  HttpProvider._(this._client);

  final remoteHostName = "https://api.microchipexpert.com.np";
  final localHostName = "http://localhost:8000";

  static final instance = HttpProvider._(HttpClient());

  Future<HttpClientResponse> fetchTickets() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/ticket"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchTicket(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/ticket/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchIssues(
    String? ticketID,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/issue/$ticketID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> postTicket(
    Ticket? ticket,
    List<Issue?> issues,
    Customer customer,
  ) async {
    final _ticket = Ticket.parseToJson(ticket);
    final _issues = issues.map((issue) => Issue.parseToJson(issue)).toList();
    final _customer = Customer.parseCustomerToJson(customer);

    Map<String, dynamic> body = {
      "param": {
        "ticket": _ticket,
        "issues": _issues,
        "customer": _customer,
      }
    };

    // String param = "param=${Uri.encodeQueryComponent(
    //   json.encode(
    //     body,
    //   ),
    // )}";

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("$localHostName/ticket/create"),
    );

    _request.headers.contentType =
        ContentType('application', 'json', charset: 'utf-8');
    _request.write(json.encode(body));

    print(json.encode(body));

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> updateTicket(
    Map<String, dynamic> updateParams,
    String ticketID,
  ) async {
    String param = "param=${Uri.encodeQueryComponent(
      json.encode(
        updateParams['param'],
      ),
    )}";
    HttpClientRequest _request = await _client.putUrl(
      Uri.parse("$localHostName/ticket/update/$ticketID?$param"),
    );

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future deleteTicket(String ticketID) async {
    HttpClientRequest _request = await _client.deleteUrl(
      Uri.parse("$localHostName/ticket/delete/$ticketID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchCustomer(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/customer/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchWorker(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/worker/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchWorkers() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/worker"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchTransactions() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("$localHostName/accounting/transaction"),
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
      Uri.parse("$localHostName/user/authenticate"),
    );

    _request.headers.contentType =
        ContentType("application", "json", charset: "utf-8");
    // _request.headers.contentLength = body.toString().length;s
    _request.write(json.encode(body));
    print(json.encode(body));
    HttpClientResponse _response = await _request.close();
    return _response;
  }
}
