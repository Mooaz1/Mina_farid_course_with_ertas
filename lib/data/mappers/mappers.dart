import 'package:mf_course/app/extenstions.dart';

import '../../domain/view_models/models.dart';
import '../response/response_models.dart';

extension CustomerLoginMapper on CoustmersLoginResponse? {
  CoustmersLogin toDomain() => CoustmersLogin(this!.id.orZero(),
      this!.name.orEmpty(), this!.numOfNotifications.orZero());
}

extension ContactsLoginMapper on ContactsLoginReponse? {
  ContactsLogin toDomain() => ContactsLogin(this!.email.orEmpty(),
      this!.email.orEmpty(), this!.link.orEmpty());
}

extension BaseLoginMapper on BaseLoginResponse? {
  BaseLogin toDomain() => BaseLogin(this!.message.orEmpty(),
      this!.status.orZero(), this!.contacts.toDomain(),this!.customer.toDomain());
}