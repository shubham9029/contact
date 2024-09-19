import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';


class HomeScreenIos extends StatefulWidget {
  const HomeScreenIos({super.key});

  @override
  State<HomeScreenIos> createState() => _HomeScreenIosState();
}

class _HomeScreenIosState extends State<HomeScreenIos> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text("iOS"),
          trailing: CupertinoSwitch(
            value: providerW!.onios,
            onChanged: (value) {
              providerR!.change();
            },
          ),
        ),
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            CupertinoAlertDialog(
              title: const Text("AlertDialog"),
              content: const FlutterLogo(
                size: 100,
              ),
              actions: [
                CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    exitDialog();
                  },
                  child: const Text("Yes"),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"),
                ),
              ],
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  child: const Text("BottomSheet"),
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: const Text("iOS"),
                        message: const Text("Message"),
                        actions: [
                          CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Yes")),
                          CupertinoActionSheetAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No")),
                          CupertinoActionSheetAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                        ],
                      ),
                    );
                  },
                ),
                CupertinoContextMenu(
                    actions: [
                      CupertinoContextMenuAction(
                        onPressed: () {},
                        trailingIcon: CupertinoIcons.add,
                        child: const Text("Click 1"),
                      ),
                      CupertinoContextMenuAction(
                        onPressed: () {},
                        trailingIcon: CupertinoIcons.recordingtape,
                        child: const Text("Click 2"),
                      ),
                    ],
                    child: const FlutterLogo(
                      size: 100,
                    )),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 250,
                          color: CupertinoColors.white,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              TimeOfDay t1 = TimeOfDay(hour: value.hour, minute: value.minute);
                              providerW!.changeTime(t1);
                            },
                            mode: CupertinoDatePickerMode.date,
                            minimumYear: 2001,
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.calendar),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          "${providerW!.date.day}/${providerW!.date.month}/${providerW!.date.year}")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 250,
                          color: CupertinoColors.white,
                          child: CupertinoDatePicker(
                            onDateTimeChanged: (value) {
                              TimeOfDay t1 = TimeOfDay(
                                  hour: value.hour, minute: value.minute);
                              providerW!.changeTime(t1);
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(CupertinoIcons.clock),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("${providerW!.time.hour}/${providerW!.time.minute}")
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoButton.filled(
                  child: const Text("Dialog"),
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text("AlertDialog"),
                          content: const FlutterLogo(
                            size: 100,
                          ),
                          actions: [
                            CupertinoDialogAction(
                              isDestructiveAction: true,
                              onPressed: () {
                                exit(0);
                              },
                              child: const Text("Yes"),
                            ),
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("No"),
                            ),
                          ],
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }

  void exitDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
            title: const Text("AlertDialog"),
            content: const FlutterLogo(
              size: 100,
            ),
            actions: [
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  exit(0);
                },
                child: const Text("Yes"),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"),
              ),
            ],
            ));
    }
}