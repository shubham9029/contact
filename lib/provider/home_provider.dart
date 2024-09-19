import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios/profile/model/profile_model.dart';

class HomeProvider with ChangeNotifier
{
  bool onios=false;
  List<ContactModel> contactList=[];
  DateTime date=DateTime.now();
  TimeOfDay time=TimeOfDay.now();
  String? path="";


  void change()
  {
    onios=!onios;
    notifyListeners();
  }

  void changeDate(DateTime newdate)
  {
    date=newdate;
    notifyListeners();
  }

  void changeTime(TimeOfDay newtime)
  {
    time=newtime;
    notifyListeners();
  }
  void addContact(ContactModel model)
  {
    contactList.add(model);
    notifyListeners();
  }
  void addPath(String p1) {
    path = p1;
    notifyListeners();
  }
}