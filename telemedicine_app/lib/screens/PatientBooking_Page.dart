import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

// HARDCODED DOCTORS AND TIMES FOR TESTING
const List<String> Doctorlist = <String>['Doctor 1', 'Doctor 2', 'Doctor 3']; // temporary Doctor names
const List<String> TimeList = <String>['11:00', '15:00', '15:30']; // Temporary Times

//Strings for the dropdown values
String doctorDropDownValue = Doctorlist.first;
String timeDropDownValue = TimeList.first;

class PatientBooking extends StatefulWidget {
  const PatientBooking({super.key});

  @override
  State<PatientBooking> createState() => PatientBookingState();
}

class PatientBookingState extends State<PatientBooking>{
  TextEditingController doctorName = new TextEditingController();
  TextEditingController dateTime = new TextEditingController();
  get child => null;

  Future _submitBooking() async {
  DateTime appdate = DateTime.parse("${dateTime.text}${"+10:00"}") ;
  String y = appdate.toIso8601String();
  Fluttertoast.showToast(msg: y);
    final response = await http.post(Uri.parse("http://10.0.2.2:8082/api/v1/create-appointment"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({
      "appointmentStartDate" : y, // Temp value
      "patientId": 12344, // Temp Value
      "doctorId" : 44321, // Temp Value
      "appointmentStatus": "ACTIVE", // Temp value

    }));
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
              controller: dateTime,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Appointment Times'
              ),
              onTap: () async{
                DateTime? pickedDate = await showDatePicker ( context: context,initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2101));
                TimeOfDay? pickedTime = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                if (pickedDate != null){
                  setState((){
                    final bookedDate = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime!.hour, pickedTime.minute);
                    dateTime.text = bookedDate.toString();
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
          

          //Available Time
          // Container(
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          //     child: Text("Select prefered time"),
          // ),
          // ),
          // Container(
          //   child: Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          //   child: DropdownButton<String>(
          //     value: timeDropDownValue,
          //     icon: const Icon(Icons.arrow_downward),
          //     elevation: 16,
          //     style: const TextStyle(color: Colors.deepOrange),
          //     underline: Container(
          //       height: 2,
          //       color: Colors.deepOrangeAccent,
          //     ),
          //     onChanged: (String? value) {
          //       setState(() {
          //         timeDropDownValue = value!;
          //         time.text = timeDropDownValue;
          //       }
          //       );
          //     },
          //     items: TimeList.map<DropdownMenuItem<String>>((String value) {
          //       return DropdownMenuItem<String>(
          //         value: value,
          //         child: Text(value),
          //         );
          //     }).toList(),
          //   ),
          // ),
          // ),
          

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
