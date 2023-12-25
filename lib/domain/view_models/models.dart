// Onbording models

class OnbordingObj {
  final String title;
  final String subTitle;
  final String image;

  OnbordingObj(
      {required this.title, required this.subTitle, required this.image});
}

class OnbordingViewObj{
  final int currentIndex;
  final int pagesCount;
  final OnbordingObj onbordingObj;

  OnbordingViewObj({required this.currentIndex, required this.pagesCount, required this.onbordingObj});
}

//login

class CoustmersLogin {
  int id;
  String name;
  int numOfNotifications;
  CoustmersLogin(this.id, this.name, this.numOfNotifications);


}

class ContactsLogin {
  String phone;
  String email;
  String link;
  ContactsLogin(this.phone, this.email, this.link);


}

class BaseLogin {
  int status;
  String message;
  CoustmersLogin customer;
  ContactsLogin contacts;
  BaseLogin(this.message, this.status, this.contacts, this.customer);

  
}