import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:telemedicine_app/globals/global_variable.dart' as globals;

import 'package:telemedicine_app/screens/PatientBooking_Page.dart';
 
//CONTROLLERS

//General Account Information
TextEditingController first_Name = new TextEditingController();
TextEditingController last_Name = new TextEditingController();
TextEditingController DOB = new TextEditingController();
TextEditingController EmailAddress = new TextEditingController();
TextEditingController Address = new TextEditingController();
TextEditingController NewPassword = new TextEditingController();

//Medical Records
TextEditingController MedicareNumber = new TextEditingController();
TextEditingController PatientWeight = new TextEditingController();
TextEditingController PatientHeight = new TextEditingController();
TextEditingController LocalGp = new TextEditingController();
TextEditingController PrevHistory = new TextEditingController();
TextEditingController PatientGender = new TextEditingController();

//Futures

//General Account Information
Future submitGAI() async{
  final response = await http.put(Uri.parse("http://10.0.2.2:8080/api/v1/update-user/${globals.userId}"),
    headers: {"Content-Type": "application/json", "Authorization":"Bearer ${globals.jwtToken}"},
    body: jsonEncode({
      "email": EmailAddress.text,
      "firstName": first_Name.text,
      "lastName": last_Name.text,
      "password": NewPassword.text,
      "DoB":  DOB.text,
      "address": Address.text,
    }),
  );
  
  if(response.statusCode == 200){
    print("workijg");
  }else{
    print("no");
  }
  // var data = json.decode(response.body);
  // if(data == "Success"){
  //   Fluttertoast.showToast(msg: "Successfully updated!");
  // } else{
  //   Fluttertoast.showToast(msg: "Error: Server Error");
  // }
}

//Medical Records
Future submitMR() async{
  final response = await http.post(Uri.parse("http://10.0.2.2:8080/api/v1/medical-record/${globals.userId}"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "medicareNo": MedicareNumber.text,
      "height": PatientHeight.text,
      "weight": PatientWeight.text,
      "medicalHistory": PrevHistory.text,
      "gender": PatientGender.text,
    }),
  );
  
  var data = json.decode(response.body);
  if(data == "Success"){
    Fluttertoast.showToast(msg: "Successfully updated!");
  } else{
    Fluttertoast.showToast(msg: "Error: Server Error");
  }
}

//Getting List of Doctors and Times
Future getDrTime() async{
  final response = await http.get(Uri.parse("http://10.0.2.2:8082/api/v1/get-timeslots/${globals.finalDate}}"),
  headers: {"Content-Type": "application/json"},
  );

}