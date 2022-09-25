import 'package:flutter/material.dart';

class DoctorChat extends StatefulWidget {
  const DoctorChat({super.key});

  @override
  State<DoctorChat> createState() => DoctorChatState();
}

class DoctorChatState extends State<DoctorChat>{
  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        //Different Fields
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            //controller: postCode,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Chat',
            ),
          ),
        ),
      ],
    );
  }
}