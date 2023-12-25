import 'package:json_annotation/json_annotation.dart';
part 'response_models.g.dart';

@JsonSerializable()
class CoustmersLoginResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;
  CoustmersLoginResponse(this.id, this.name, this.numOfNotifications);

  factory CoustmersLoginResponse.fromJson(Map<String,dynamic> json)=>_$CoustmersLoginFromJson(json);

  Map<String,dynamic> toJson()=>_$CoustmersLoginToJson(this);
}

@JsonSerializable()
class ContactsLoginReponse {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactsLoginReponse(this.phone, this.email, this.link);

  factory ContactsLoginReponse.fromJson(Map<String,dynamic> json)=>_$ContactsLoginFromJson(json);

  Map<String,dynamic> toJson()=>_$ContactsLoginToJson(this);
}

@JsonSerializable()
class BaseLoginResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "customer")
  CoustmersLoginResponse? customer;
  @JsonKey(name: "contacts")
  ContactsLoginReponse? contacts;
  BaseLoginResponse(this.message, this.status, this.contacts, this.customer);
factory BaseLoginResponse.fromJson(Map<String,dynamic> json)=>_$BaseLoginFromJson(json);

  Map<String,dynamic> toJson()=>_$BaseLoginToJson(this);
  
}
