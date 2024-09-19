import 'package:flutter/material.dart';
import 'package:ios/provider/home_provider.dart';
import 'package:provider/provider.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: providerR!.contactList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 80,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text("${providerW!.contactList[index].name![0]}",style: TextStyle(
                          fontSize: 30
                        ),),
                      ),
                      SizedBox(width:20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${providerW!.contactList[index].name}",
                              style: TextStyle(fontSize: 20)),
                          Text(
                            "${providerW!.contactList[index].phone}",
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.call))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
