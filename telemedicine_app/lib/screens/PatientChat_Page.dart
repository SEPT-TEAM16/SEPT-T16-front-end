import 'package:flutter/material.dart';

class PatientChat extends StatefulWidget {
  const PatientChat({super.key});

  @override
  State<PatientChat> createState() => PatientChatState();
}

class PatientChatState extends State<PatientChat>{
  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text("Enter your selection"),

        //Different Fields
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'chat',
            )
          ),
        ),
      ],
    );
  }
}