import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:sigma_app/src/models/customer.dart';
import 'package:sigma_app/src/models/issue.dart';
import 'package:sigma_app/src/models/ticket.dart';
import 'package:sigma_app/src/models/transaction.dart';
import 'package:sigma_app/src/models/user.dart';
import 'package:sigma_app/src/models/worker.dart';
import 'package:sigma_app/src/server/http_provider.dart';

class Repository {
  final HttpProvider _provider = HttpProvider.instance;

  Stream<List<Ticket?>> fetchTickets() async* {
    final response = await _provider.fetchTickets();
    yield* utf8.decoder
        .bind(response)
        .transform(StreamTransformer<String, List<Ticket?>>.fromHandlers(
      handleData: (data, sink) {
        final List<dynamic> tickets = jsonDecode(data)['data']['original'];
        // print(tickets[0]['id']);
        List<Ticket?> sinkData = [];
        for (var ticket in tickets) {
          sinkData.add(Ticket.parseToTicket(ticket));
        }
        sink.add(sinkData);
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
            jsonDecode(data)['data']['original'];
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

  Stream<Ticket?> postTicket(
    Ticket? newTicket,
    List<Issue?> newIssues,
    Customer newCustomer,
  ) async* {
    final response = await _provider.postTicket(
      newTicket,
      newIssues,
      newCustomer,
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

  Stream<List<Worker>> fetchWorkers() async* {
    final response = await _provider.fetchWorkers();
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

  Stream<User> login(String username, String password) async* {
    final response = await _provider.login(username, password);
    // print(response.headers);
    yield* utf8.decoder.bind(response).transform(
      StreamTransformer<String, User>.fromHandlers(
        handleData: (data, sink) {
          // print(User.parseJsonToUser(jsonDecode(data)['data']['original']));
          if (jsonDecode(data)['data']['original'] != {}) {
            final user = jsonDecode(data)['data']['original'];
            sink.add(User.parseJsonToUser(user));
          } else {
            sink.addError(jsonDecode(data));
          }
        },
      ),
    );
  }
}
