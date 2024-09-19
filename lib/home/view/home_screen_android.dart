import 'package:flutter/material.dart';
import 'package:ios/call/view/call_screen.dart';
import 'package:ios/chat/view/chat_scneer.dart';
import 'package:ios/profile/view/profile_screen.dart';
import 'package:ios/provider/home_provider.dart';
import 'package:ios/status/view/view_screen.dart';
import 'package:provider/provider.dart';

class HomeScreenAndroid extends StatefulWidget {
  const HomeScreenAndroid({super.key});

  @override
  State<HomeScreenAndroid> createState() => _HomeScreenAndroidState();
}

class _HomeScreenAndroidState extends State<HomeScreenAndroid> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  @override


  Widget build(BuildContext context) {
    providerR=context.read<HomeProvider>();
    providerW=context.watch<HomeProvider>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Android"),
          centerTitle: true,
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.chat),),
            Tab(icon: Icon(Icons.call),),
            Tab(icon: Icon((Icons.person)),),
            Tab(icon: Icon(Icons.refresh),),
          ]),
          actions: [
            Switch(value: providerW!.onios, onChanged: (value) {
              providerR!.change();
            },),
          ],

        ),
        body: Center(
           child: TabBarView(
             children: [
               ChatScreen(),
               CallScreen(),
               ProfileScreen(),
               StatusSCreen(),
             ],
           ),

        ),

      ),
    );
  }
}
