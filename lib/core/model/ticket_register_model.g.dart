// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketRegisterModel _$TicketRegisterModelFromJson(Map<String, dynamic> json) {
  return TicketRegisterModel(
    eventId: json['event_id'] as String,
    eventType: json['event_type'] as String,
    guest: GuestModel.fromJson(json['guest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TicketRegisterModelToJson(
        TicketRegisterModel instance) =>
    <String, dynamic>{
      'event_id': instance.eventId,
      'event_type': instance.eventType,
      'guest': instance.guest.toJson(),
    };
