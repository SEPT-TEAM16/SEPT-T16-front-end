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

  //Start and end time variables
  String Start1 = "";
  String End1 = "";
  String Start2 = "";
  String End2 = "";
  String Start3 = "";
  String End3 = "";
  String Start4 = "";
  String End4 = "";
  String Start5 = "";
  String End5 = "";

  // Submit Doctor Avaliability
  Future _submitDoctorAvalibitiy() async { //                                   v get actualt link
  final response = await http.post(Uri.parse("http://localhost:8081/api/v1/avalibities"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({  
        "doctorID" : 123,
    "Schedule" : [
      {
        "start": Start1,
        "end": End1
      },
      {
        "start": Start2,
        "end": End2
      },
      {
        "start": Start3,
        "end": End3
      },
      {
        "start": Start4,
        "end": End4
      },
      {
        "start": Start5,
        "end": End5
      },
    ]

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


              // Get All dates
              List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
                List<DateTime> days = [];
                for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
                  days.add(startDate.add(Duration(days: i)));
                }
                return days;
              }
              DateTime startDate = dateRange.selectedRange!.startDate as  DateTime;
              DateTime endDate = dateRange.selectedRange!.endDate as  DateTime; 
              List<DateTime> days = getDaysInBetween(startDate, endDate);

              //Monday Start Time
              String x = days[0].toIso8601String().split("T").first.toString();
              String mS1 = x + " " + MondayStartTime.text + ":00+10:00";;
              DateTime appdate = DateTime.parse(mS1);
              Start1 = appdate.toIso8601String();
              print(MondayStartTime.text);
              print(mS1);
              //Monday End Time
              x = days[0].toIso8601String().split("T").first.toString();
              mS1 = x + " " + MondayEndTime.text + ":00+10:00";;
              appdate = DateTime.parse(mS1);
              End1 = appdate.toIso8601String();
              print(Start1);

              //Test Section

              // Fluttertoast.showToast(msg: dateRange.selectedRange!.startDate.toString());
              // Navigator.pushNamed(context, '/LogintoDDashboard');
            },
            child: Text("Submit Avalibities"),
          ),
      )
      ],
    );
  }
}