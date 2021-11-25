// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GuestModel _$GuestModelFromJson(Map<String, dynamic> json) {
  return GuestModel(
    id: json['id'] as String?,
    name: json['name'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    company: json['company'] as String?,
    job: json['job'] as String?,
  );
}

Map<String, dynamic> _$GuestModelToJson(GuestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'company': instance.company,
      'job': instance.job,
    };
