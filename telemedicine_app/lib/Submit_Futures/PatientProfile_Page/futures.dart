import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

 
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
  final response = await http.post(Uri.parse("http://localhost:8081/api/v1/update-user/" + "userId"), //GET USER ID
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "firstName": first_Name.text,
      "lastName": last_Name.text,
      "DoB":  DOB.text,
      "email": EmailAddress.text,
      "address": Address.text,
      "password": NewPassword.text,
    }),
  );
  
  var data = json.decode(response.body);
  if(data == "Success"){
    Fluttertoast.showToast(msg: "Successfully updated!");
  } else{
    Fluttertoast.showToast(msg: "Error: Server Error");
  }
}

//Medical Records
Future submitMR() async{
  final response = await http.post(Uri.parse("http://localhost:8081/api/v1/medical-record/" + "userId"), //GET USER ID
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