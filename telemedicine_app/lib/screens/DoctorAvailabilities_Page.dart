import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// Avaliabilities Time 7am to 5pm in 24hour time
const List<String> Times = <String>['07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00'];

class DoctorAvailability extends StatefulWidget {
  const DoctorAvailability({super.key});

  @override
  State<DoctorAvailability> createState() => DoctorAvailabilityState();
}

class DoctorAvailabilityState extends State<DoctorAvailability>{
  // TextEditingController date = new TextEditingController();
  TextEditingController MondayStartTime =new TextEditingController();
  TextEditingController MondayEndTime =new TextEditingController();
  TextEditingController TuesdayStartTime =new TextEditingController();
  TextEditingController TuesdayEndTime =new TextEditingController();
  TextEditingController WednesdayStartTime =new TextEditingController();
  TextEditingController WednesdayEndTime =new TextEditingController();
  TextEditingController ThursdayStartTime =new TextEditingController();
  TextEditingController ThursdayEndTime =new TextEditingController();
  TextEditingController FridayStartTime =new TextEditingController();
  TextEditingController FridayEndTime =new TextEditingController();
  DateRangePickerController dateRange =new DateRangePickerController();

  String MondayStart = Times.first;
  String MondayEnd = Times.first;
  String TuesdayStart = Times.first;
  String TuesdayEnd = Times.first;
  String WednesdayStart = Times.first;
  String WednesdayEnd = Times.first;
  String ThursdayStart = Times.first;
  String ThursdayEnd = Times.first;
  String FridayStart = Times.first;
  String FridayEnd = Times.first;

  // Submit Doctor Avaliability
  Future _submitDoctorAvalibitiy() async { //                                   v get actualt link
  final response = await http.post(Uri.parse("http://localhost:8081/api/v1/avalibities"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({  
    //Monday Time
    //TuesdayTime
    //Wednesday Time
    //Thursday Time
    //Friday Time

  }));
    
}
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Different Fields
          Center(child: Row(
            children: <Widget>[
              Expanded(
                child: SfDateRangePicker(
                  controller: dateRange,
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.range,
                  monthViewSettings:DateRangePickerMonthViewSettings(blackoutDates:[DateTime(2020, 03, 26)],
                  weekendDays: [7,6],
                  specialDates:[DateTime(2020, 03, 20),DateTime(2020, 03, 16),DateTime(2020,03,17)],
                  showTrailingAndLeadingDates: true),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    blackoutDatesDecoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: const Color(0xFFF44436), width: 1),
                        shape: BoxShape.circle),
                  weekendDatesDecoration: BoxDecoration(
                      color: const Color(0xFFDFDFDF),
                      border: Border.all(color: const Color(0xFFB6B6B6), width: 1),
                      shape: BoxShape.circle),
                  specialDatesDecoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: const Color(0xFF2B732F), width: 1),
                      shape: BoxShape.circle),
            blackoutDateTextStyle: TextStyle(color: Colors.white, decoration: TextDecoration.lineThrough),
            specialDatesTextStyle: const TextStyle(color: Colors.white),
                ),
                )
          ),
          ],
          ),
          ),


        // Monday Text
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                child: Text("Monday Start Time"),
                ),
                ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                child: Text("Monday End Time"),
                ),
                ),
            ],
          ),
        ),

        // Monday Dropdown menus
        Center(
          child: Row(
          children: <Widget>[
          Expanded(
          child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: 
          DropdownButton<String>(
            value: MondayStart,
            borderRadius: BorderRadius.circular(10),
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                MondayStart = value!;
                MondayStartTime.text = MondayStart;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),
        ),
        Expanded(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: 
          DropdownButton<String>(
            value: MondayEnd,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                MondayEnd = value!;
                MondayEndTime.text = MondayEnd;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),)
            ],
          ),   
        ),

        // Tuesday text
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Tuesday Start Time",),
                ),
                ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Tuesday End Time"),
                ),
                ),
            ],
          ),
        ),


        Center(
          child: Row(
          children: <Widget>[
          Expanded(
          child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: TuesdayStart,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                TuesdayStart = value!;
                TuesdayStartTime.text = TuesdayStart;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),
        ),
        Expanded(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: TuesdayEnd,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                TuesdayEnd = value!;
                TuesdayEndTime.text = TuesdayEnd;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),)
            ],
          ),
        ),

      // Wednesday text
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Wednesday Start Time",),
                ),
                ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Wednesday End Time"),
                ),
                ),
            ],
          ),
        ),

        // Wednesday Dropdown menu
        Center(
          child: Row(
          children: <Widget>[
          Expanded(
          child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: WednesdayStart,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                WednesdayStart = value!;
                WednesdayStartTime.text = WednesdayStart;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),
        ),
        Expanded(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: WednesdayEnd,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                WednesdayEnd = value!;
                WednesdayEndTime.text = WednesdayEnd;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),)
            ],
          ),
        ),


        // Thursday text
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Thursday Start Time",),
                ),
                ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Thursday End Time"),
                ),
                ),
            ],
          ),
        ),
        // Thursday Dropdown menu
        Center(
          child: Row(
          children: <Widget>[
          Expanded(
          child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: ThursdayStart,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                ThursdayStart = value!;
                ThursdayStartTime.text = ThursdayStart;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),
        ),
        Expanded(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: ThursdayEnd,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                ThursdayEnd = value!;
                ThursdayEndTime.text = ThursdayEnd;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),)
            ],
          ),
        ),

        // Friday text
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Friday Start Time",),
                ),
                ),
              Expanded(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
                child: Text("Friday End Time"),
                ),
                ),
            ],
          ),
        ),
        
        // Friday Dropdown menu
        Center(
          child: Row(
          children: <Widget>[
          Expanded(
          child:Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: FridayStart,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                FridayStart = value!;
                FridayStartTime.text = FridayStart;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),
        ),
        Expanded(
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: FridayEnd,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 3,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                FridayEnd = value!;
                FridayEndTime.text = FridayEnd;
              });
            },
            items: Times.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),)
            ],
          ),
        ),

      // Submit button
      Center(
        child: ElevatedButton(
            onPressed: (){
              // _submitDoctorAvalibitiy(); will be used later when intergrating front to back


              // Test Section
              List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
              List<DateTime> days = [];
                for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
                  days.add(
                    DateTime(
                      startDate.year, 
                      startDate.month, 
                      // In Dart you can set more than. 30 days, DateTime will do the trick
                      startDate.day + i)
                  );
                }
              return days;
              }
              //Test Section

              Fluttertoast.showToast(msg: "Temp");
              // Navigator.pushNamed(context, '/LogintoDDashboard');
            },
            child: Text("Submit Avalibities"),
          ),
      )
      ],
    );
  }
}