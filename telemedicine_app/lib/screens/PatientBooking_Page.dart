import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:telemedicine_app/globals/global_variable.dart' as globals;

// HARDCODED DOCTORS AND TIMES FOR TESTING
const List<String> Doctorlist = <String>['','Doctor Lucas Smith', 'Doctor Nelson Jones', 'Doctor Daniel Ye', 'Doctor Wyatt Ye', 'Doctor Rico Nguyen']; // temporary Doctor names

//Strings for the dropdown values
String doctorDropDownValue = Doctorlist.first;

class PatientBooking extends StatefulWidget {
  const PatientBooking({super.key});

  @override
  State<PatientBooking> createState() => PatientBookingState();
}

class PatientBookingState extends State<PatientBooking>{
  TextEditingController doctorName = new TextEditingController();
  TextEditingController dateTime = new TextEditingController();
  TextEditingController dateTimeText = new TextEditingController();
  get child => null;

  Future _submitBooking() async {
  DateTime appdate = DateTime.parse("${dateTime.text}${"+10:00"}") ;
  String y = appdate.toIso8601String();
    final response = await http.post(Uri.parse("http://10.0.2.2:8082/api/v1/create-appointment"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({
      "appointmentStartDate" : y,
      "patientId": globals.userId,
      "doctorId" : 44321, // Temp Value
      "appointmentStatus": "ACTIVE", // Temp value

    }));
    if(response.statusCode == 200 ){  
      Fluttertoast.showToast(msg:"Appointment booked");
      Navigator.pushNamed(context,'/LogintoPDashboard');
    }else{
      Fluttertoast.showToast(msg:"Appointment booking failed");
    };

  }

  //Building the Widget
  @override
  Widget build(BuildContext context) {

  return Column(
        children: <Widget>[
          Container( child: Padding( padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Text("Select prefered date"),
          ),
          ),

          //Date Picker
          Container(
            child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: dateTimeText,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Appointment Times'
              ),
              onTap: () async{
                DateTime? pickedDate = await showDatePicker ( context: context,initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2101));
                TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (pickedDate != null && pickedTime != null){
                  setState((){
                    String bookingDateMin;
                    int minuteNum;
                    if(pickedTime.minute < 30){
                      bookingDateMin = "00";
                      minuteNum = 0;
                    }
                    else{
                      bookingDateMin = "30";
                      minuteNum = 30;
                    }
                    final bookedDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, minuteNum, );
                    dateTime.text = bookedDate.toString();
                    if (pickedTime.hour > 12){
                      dateTimeText.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day} at ${pickedTime.hour - 12}:${bookingDateMin}pm";
                    }else{
                      dateTimeText.text = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day} at ${pickedTime.hour}:${bookingDateMin}am";
                    }
                  }
                  );
                }
              }
            )
          ),),

          //Doctor List
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child: Text("Select prefered doctor"),
          ),
          ),
          Container(
            child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownButton<String>(
              value: doctorDropDownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepOrange),
              underline: Container(
                height: 2,
                color: Colors.deepOrangeAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  doctorDropDownValue = value!;
                  doctorName.text = doctorDropDownValue;
                }
                );
              },
              items: Doctorlist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
              }).toList(),
            ),
          ),
          ),


          //Submit Button
          Center(child:  Container(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: (){
                _submitBooking();
              },
              child: Text("Submit Booking"),
            )
          ),),)
          
        ],
      );
    }
}
