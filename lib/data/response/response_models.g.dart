// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoustmersLoginResponse _$CoustmersLoginFromJson(Map<String, dynamic> json) =>
    CoustmersLoginResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['numOfNotifications'] as int?,
    );

Map<String, dynamic> _$CoustmersLoginToJson(CoustmersLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotifications': instance.numOfNotifications,
    };

ContactsLoginReponse _$ContactsLoginFromJson(Map<String, dynamic> json) =>
    ContactsLoginReponse(
      json['phone'] as String?,
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactsLoginToJson(ContactsLoginReponse instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

BaseLoginResponse _$BaseLoginFromJson(Map<String, dynamic> json) => BaseLoginResponse(
      json['message'] as String?,
      json['status'] as int?,
      json['contacts'] == null
          ? null
          : ContactsLoginReponse.fromJson(json['contacts'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CoustmersLoginResponse.fromJson(json['customer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseLoginToJson(BaseLoginResponse instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
