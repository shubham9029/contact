import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                          TextButton.icon(onPressed: () async {
                            DateTime? d1= await showDatePicker(context: context, firstDate: DateTime(2001), lastDate: DateTime(2030));
                            providerW!.changeDate(d1!);

                          }, icon:Icon (Icons.calculate),
                              label: Text("${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}")),
                          
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

extension on Function() {
  icon({required Future<Null> Function() onPressed, required Icon icon, required Text label}) {}
}
