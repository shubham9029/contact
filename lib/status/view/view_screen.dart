import 'package:flutter/material.dart';

class StatusSCreen extends StatefulWidget {
  const StatusSCreen({super.key});

  @override
  State<StatusSCreen> createState() => _StatusSCreenState();
}

class _StatusSCreenState extends State<StatusSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: Text("stautsScreen"),
      ),
    );
  }
}
