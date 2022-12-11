import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:sigma_app/src/models/serializer.dart';

part 'ticket.g.dart';

abstract class Ticket implements Built<Ticket, TicketBuilder> {
  static Serializer<Ticket> get serializer => _$ticketSerializer;

  // Ticket ID
  String? get id;
  // Device Manufracturer
  String? get device_manufacturer;
  // Device Manufracturer
  String? get device_model;
  // Admin ID
  String get opened_by;
  // Center ID
  String get center_id;
  // Customer Name or ID
  String? get customer_id;
  // Ticket is open or close
  int get is_closed;
  // Payment completed or not
  int get is_payment_due;
  // Service worker Name or ID
  String? get serviced_by;
  // Service completed time
  String? get closed_at;
  // Service started date
  String get opened_at;
  // Item delivered by
  String? get closed_by;
  // Total cost of the service
  int? get total_service_cost;
  // Number of problems in the device
  int get issue_count;
  // Number of unsolved problems in the device
  int get open_issue;
  // Number of solved problems in the device
  int get closed_issue;
  // Payment recieved by
  String? get pay_recieved_by;
  // Payment Timestamp
  String? get paid_at;

  Ticket._();
  factory Ticket([void Function(TicketBuilder) updates]) = _$Ticket;

  static Ticket? parseToTicket(Map<String, dynamic> json) =>
      jsonSerializer.deserializeWith(
        Ticket.serializer,
        json,
      );

  static Map<String, dynamic> parseToJson(Ticket? ticket) => {
        "id": ticket!.id,
        "device_manufacturer": ticket.device_manufacturer,
        "device_model": ticket.device_model,
        "opened_by": ticket.opened_by,
        "center_id": ticket.center_id,
        "customer_id": ticket.customer_id,
        "is_closed": ticket.is_closed,
        "is_payment_due": ticket.is_payment_due,
        "serviced_by": ticket.serviced_by,
        "closed_at": ticket.closed_at,
        "opened_at": ticket.opened_at,
        "closed_by": ticket.closed_by,
        "total_service_cost": ticket.total_service_cost,
        "issue_count": ticket.issue_count,
        "open_issue": ticket.open_issue,
        "closed_issue": ticket.closed_issue,
        "pay_recieved_by": ticket.pay_recieved_by,
        "paid_at": ticket.paid_at,
      };
}
