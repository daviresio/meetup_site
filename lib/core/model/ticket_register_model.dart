import 'package:json_annotation/json_annotation.dart';
import 'package:meetup_site/core/model/guest_model.dart';

part 'ticket_register_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TicketRegisterModel {
  final String eventId;
  final String eventType;
  final GuestModel guest;

  TicketRegisterModel({
    required this.eventId,
    required this.eventType,
    required this.guest,
  });

  factory TicketRegisterModel.fromJson(Map<String, dynamic> json) =>
      _$TicketRegisterModelFromJson(json);

  Map<String, dynamic> toJson() => _$TicketRegisterModelToJson(this);
}
