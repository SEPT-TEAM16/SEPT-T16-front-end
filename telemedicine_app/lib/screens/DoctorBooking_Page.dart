import 'package:flutter/material.dart';


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
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Text('Show todays bookings from get'), //GET
                //We will need: appointmentStartDate + appointmentEndDate + patient + appointmentStatus
                //from the response body from get i think
              ),
              ]
              else if (tomorrow == true) ...[
                Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Text('Show tomorrows bookings from get'), //GET
              ),
              ]
              else if (week == true) ...[
                Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Text('Show weeks bookings from get'), //GET
              )
              ]
            ],
          )
        ),  
      ],
    );
  }
}
