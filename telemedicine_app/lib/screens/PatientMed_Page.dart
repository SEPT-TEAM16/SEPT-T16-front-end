import 'package:flutter/material.dart';

class PatientMed extends StatefulWidget {
  const PatientMed({super.key});

  @override
  State<PatientMed> createState() => PatientMedState();
}

class PatientMedState extends State<PatientMed>{
  bool meds = false;


  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text('Your Medication'),
        //Different Fields
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            'Your Medication:'
          )
        ),

        if (meds == false) ...[
          Container(
            child: Text('No medications to display'),
          )
        ]
      ],
    );
  }
}