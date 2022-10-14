import 'dart:convert';
import 'dart:io';

import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/ticket.dart';

import '../models/issue.dart';

class HttpProvider {
  final HttpClient _client;

  HttpProvider._(this._client);

  static final instance = HttpProvider._(HttpClient());

  Future<HttpClientResponse> fetchTickets() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("http://localhost:8000/ticket"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchTicket(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("http://localhost:8000/ticket/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchIssues(
    String? ticketID,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("http://localhost:8000/issue/$ticketID"),
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
      "ticket": _ticket,
      "issues": _issues,
      "customer": _customer,
    };

    String param = "param=${Uri.encodeQueryComponent(
      json.encode(
        body,
      ),
    )}";

    HttpClientRequest _request = await _client.postUrl(
      Uri.parse("http://localhost:8000/ticket/create?$param"),
    );

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
      Uri.parse("http://localhost:8000/ticket/update/$ticketID?$param"),
    );

    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future deleteTicket(String ticketID) async {
    HttpClientRequest _request = await _client.deleteUrl(
      Uri.parse("http://localhost:8000/ticket/delete/$ticketID"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchCustomer(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("http://localhost:8000/customer/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchWorker(
    String? id,
  ) async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("http://localhost:8000/worker/$id"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }

  Future<HttpClientResponse> fetchWorkers() async {
    HttpClientRequest _request = await _client.getUrl(
      Uri.parse("http://localhost:8000/worker"),
    );
    HttpClientResponse _response = await _request.close();
    return _response;
  }
}
