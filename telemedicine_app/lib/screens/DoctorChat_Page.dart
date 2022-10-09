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
    
    //When loaded it should come up with list of patients doctor can talk to
    //Once chosen, the doctor should be able to talk to patient.


    return Column(
      children: <Widget>[
        const Text('Start your chat with: ' + 'Patient Name'),
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