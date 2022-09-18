import 'package:flutter/material.dart';
import 'package:telemedicine_app/main.dart';
import 'package:telemedicine_app/widgets/widget.dart';
import '/main.dart';

var customRoutes = <String, WidgetBuilder>{
  //Set for home screen: Can use for testing page, will set to login once everything done.
  '/': (context) => LoginPage(),

  //Routes for program
  '/DdashtoAvailability': (context) => DoctorsAvailabilitiesPage(),
  '/DdashtoBooking': (context) => DoctorBookingPage(),
  '/DdashtoChats': (context) => DoctorsChatPage(),
  '/RegotoProfile': (context) => LoginPage(),
  '/LogintoPDashboard':(context) => PatientsDashboardPage(),
  '/LogintoRego':(context) => RegistrationPage()
  
};
