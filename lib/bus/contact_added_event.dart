import 'package:event_taxi/event_taxi.dart';
import 'package:nyano_mobile_flutter/model/db/contact.dart';

class ContactAddedEvent implements Event {
  final Contact contact;

  ContactAddedEvent({this.contact});
}