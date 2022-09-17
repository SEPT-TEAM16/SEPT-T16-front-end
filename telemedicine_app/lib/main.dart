import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import "/widgets/widget.dart";




void main() {
  runApp(MaterialApp(
    title: "ND Telemedicine",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',

    routes: {
    //TESTING PURPOSES
    '/':(context) => DoctorBookingPage(),
      
    // '/': (context) => LoginPage(),
    // 'RegotoPDash' => PatientDashboardScreen();
    // 'DdashtoBooking' => DbookingScreen();
    // 'PdashtoBooking' => PbookingScreen();
    },
  ));
}

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Login Page")
//       ),
//       body: SingleChildScrollView(child: loginPage())
//     );
//   }
// }

class DoctorBookingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor Bookings")
      ),
      body: SingleChildScrollView(child: DoctorBooking()),
    );
  }
}

class DoctorDashboardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to your Dashboard')
      ),
      body: SingleChildScrollView(child: DoctorDashboard()),
    );
  }
}

class DoctorsAvailabilitiesPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Set your Availabilities')
      ),
      body: SingleChildScrollView(child: DoctorAvailability()),
    );
  }
}

class DoctorsChatPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with a patient')
      ),
      body: SingleChildScrollView(child: DoctorChat()),
    );
  }
}

class PatientsDashboardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to your dashboard')
      ),
      body: SingleChildScrollView(child: PatientDashboard()),
    );
  }
}

class PatientsProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter your details')
      ),
      body: SingleChildScrollView(child: PatientProfile()),
    );
  }
}

class PatientsChatPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('')
      ),
      body: SingleChildScrollView(child: PatientChat()),
    );
  }
}

class PatientsBookingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Book an Appointment')
      ),
      body: SingleChildScrollView(child: PatientBooking()),
    );
  }
}