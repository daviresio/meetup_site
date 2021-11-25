import 'package:json_annotation/json_annotation.dart';

part 'guest_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GuestModel {
  String? id;
  String name;
  String phone;
  String email;
  String? company;
  String? job;

  GuestModel({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.company,
    this.job,
  });

  factory GuestModel.fromJson(Map<String, dynamic> json) =>
      _$GuestModelFromJson(json);

  Map<String, dynamic> toJson() => _$GuestModelToJson(this);
}
