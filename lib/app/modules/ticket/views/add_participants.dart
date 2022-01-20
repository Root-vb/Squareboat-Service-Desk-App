import 'package:flutter/material.dart';

class AllParticipantsList extends StatelessWidget {
  const AllParticipantsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListTile(
        leading: Text("Name"),
        trailing: Checkbox(value: true, onChanged: (_) {}),
      ),
    );
  }
}
