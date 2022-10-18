import 'package:flutter/material.dart';
import 'package:telemedicine_app/screens/PatientBooking_Page.dart';
import 'package:telemedicine_app/screens/PatientMed_Page.dart';
import "/config/routes/routes.dart";
import 'package:telemedicine_app/widgets/quotes/core/locator.dart';

//Screens imports
import 'package:telemedicine_app/screens/Registration_Page.dart';
import 'package:telemedicine_app/screens/Login_Page.dart';
import 'package:telemedicine_app/screens/DoctorAvailabilities_Page.dart';
import 'package:telemedicine_app/screens/DoctorBooking_Page.dart';
import 'package:telemedicine_app/screens/DoctorChat_Page.dart';
import 'package:telemedicine_app/screens/DoctorDashboard_Page.dart';
import 'package:telemedicine_app/screens/PatientChat_Page.dart';
import 'package:telemedicine_app/screens/PatientDashboard_Page.dart';
import 'package:telemedicine_app/screens/PatientProfile_Page.dart';

void main() {
  Locator.injectDependencies();

  runApp(MaterialApp(
    title: "ND Telemedicine",
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: customRoutes,
  ));
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Now")
      ),
      body: SingleChildScrollView(child: MyCustomForm())
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page")
      ),
      body: SingleChildScrollView(child: Login())
    );
  }
}

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

class PatientMedicationPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication')
      ),
      body: SingleChildScrollView(child: PatientMed()),
    );
  }
}