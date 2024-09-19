import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios/provider/home_provider.dart';
import 'package:ios/utils/routes_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [ChangeNotifierProvider.value(value: HomeProvider())],
        child: Consumer<HomeProvider>(
    builder: (context, value, child) => value.onios==false
         ?  MaterialApp(
      routes: routes_app_android,
        )
        :
        CupertinoApp(
          routes: routes_app_ios,
        )
     )

  )
  ,


  );
}