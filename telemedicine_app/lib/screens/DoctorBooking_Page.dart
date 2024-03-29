import 'package:flutter/material.dart';
import 'package:telemedicine_app/constants/api_service.dart';

import 'package:telemedicine_app/modules/profile/models/appointment_models.dart';
import 'package:telemedicine_app/globals/global_variable.dart' as globals;

//List for the time periods that shows on doctors booking
const List<Widget> times = <Widget>[
  Text('Today'),
  Text('Tomorrow'),
  Text('Week'),
];

class DoctorBooking extends StatefulWidget {
  const DoctorBooking({super.key});

  @override
  State<DoctorBooking> createState() => DoctorBookingState();
}

class DoctorBookingState extends State<DoctorBooking>{

  //booleans for the toggle button at the top of the screen
  final List<bool> _selectedTimes = <bool>[true, false, false];
  bool vertical = false;
  bool today = true;
  bool tomorrow = false;
  bool week = false;

  //FOR THE GET
  late Future<AppInfo> futureAppInfo;

  @override
  void initState() {
    super.initState();
    futureAppInfo = getAppointmentDoctor();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        const Text(
          'Sort by Period: ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),

        Container(
          width: 1000,
          child: Padding(
          padding: EdgeInsets.all(10), //NEED TO FIX PADDING TO CENTER
          child: ToggleButtons(
            direction: vertical ? Axis.vertical : Axis.horizontal,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selectedTimes.length; i++) {
                  
                  //CHOOSES THE TOGGLE BUTTONS AND THEN CHANGES OUR BOOLEANS
                  if (i == index) {
                    _selectedTimes[i] = true;
                    if (index == 0) {
                      today = true;
                      tomorrow = false;
                      week = false;
                    } else if (index == 1) {
                      today = false;
                      tomorrow = true;
                      week = false;
                    } else if (index == 2) {
                      today = false;
                      tomorrow = false;
                      week = true;
                    }
                  } else {
                    _selectedTimes[i] = false;
                  }
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.orange[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.orange[200],
                  color: Colors.orange[400],
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 122.0,
                  ),
                  isSelected: _selectedTimes,
                  children: times,
          ),
          ),
        ),
 
        Container(
          child: Column(
            children: <Widget>[
              if (today == true) ...[
              Container(

                child: FutureBuilder<AppInfo>(
                  future: futureAppInfo,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data!.appointmentStartDate.toString());
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                )
              ),
              ]
              else if (tomorrow == true) ...[
                Container(
                child: const CircularProgressIndicator(),
              ),
              ]
              else if (week == true) ...[
                Container(
                child: const CircularProgressIndicator(),
              )
              ]
            ],
          )
        ),  
      ],
    );
  }
}
