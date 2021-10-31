import 'package:event_taxi/event_taxi.dart';
import 'package:nyano_mobile_flutter/model/db/contact.dart';

class ContactRemovedEvent implements Event {
  final Contact contact;

  ContactRemovedEvent({this.contact});
}