import 'package:event_taxi/event_taxi.dart';
import 'package:nyano_mobile_flutter/model/db/contact.dart';

class ContactModifiedEvent implements Event {
  final Contact contact;

  ContactModifiedEvent({this.contact});
}