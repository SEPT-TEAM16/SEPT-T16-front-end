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
                  _selectedTimes[i] = i == index;
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

        //Create constructor to build new bookings per get body
        Container(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            
            child: Text(
              'Booking 1',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Roboto',
                color: Colors.black,
              ),
            ),
          ),
        )

      ],
    );
  }
}
