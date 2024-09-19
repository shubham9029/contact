import 'package:flutter/cupertino.dart';
import 'package:ios/home/view/home_screen_android.dart';
import 'package:ios/home/view/home_screen_ios.dart';
import 'package:ios/profile/view/profile_screen.dart';

Map<String,WidgetBuilder>routes_app_android=
{
  "/":(context)=>HomeScreenAndroid(),

};

Map<String,WidgetBuilder>routes_app_ios=
{
  "/":(context)=>HomeScreenIos(),
};