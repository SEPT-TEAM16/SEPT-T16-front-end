import 'package:flutter/material.dart';
import 'package:telemedicine_app/main.dart';
import 'package:telemedicine_app/screens/DoctorBooking_Page.dart';
import 'package:telemedicine_app/screens/PatientMed_Page.dart';
import 'package:telemedicine_app/widgets/quotes/core/domain/quotes_entity.dart';
import '/main.dart';


var customRoutes = <String, WidgetBuilder>{
  //Set for home screen: Can use for testing page, will set to login once everything done.
  '/': (context) => PatientsDashboardPage(),

  //Routes for program
  '/DdashtoAvailability': (context) => DoctorsAvailabilitiesPage(),
  '/DdashtoBooking': (context) => DoctorBookingPage(),
  '/DdashtoChats': (context) => DoctorsChatPage(),
  '/RegotoProfile': (context) => LoginPage(),
  '/LogintoPDashboard':(context) => PatientsDashboardPage(),
  '/LogintoRego':(context) => RegistrationPage(),
  '/PdashtoBooking':(context) => PatientsBookingPage(),
  '/PdashtoProfile':(context) => PatientsProfilePage(),
  '/PdashtoChats':(context) => PatientsChatPage(),
  '/LogintoDDashboard':(context) => DoctorDashboardPage(),
  '/PdashtoMed' :(context) => PatientMedicationPage(),

};
