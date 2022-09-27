import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine_app/widgets/quotes/core/locator.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget_controller.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => PatientDashboardState();
}

class PatientDashboardState extends State<PatientDashboard>{
  // TextEditingController date = new TextEditingController();

    //Quotes
  final QuoteWidgetController controller = locator.get();
  @override 
  void initState() {
    super.initState();
    controller.init();
  }
  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    //Getting Doctor Name
  String pName = ' Oscar ' + ' Nguyen '; //string should be first_name + last_name for Patient
  //Getting Date
  var dt = DateTime.now();
  //formating date
  String pdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());

    return Center( 
      child: Column(
      children: <Widget>[
        Container(
          child: Text(
            pName,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
              fontSize: 25
            )
          )
        ),
        
        Container( //DATE CONTAINER 
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            pdate2,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w400,
              fontSize: 16
            )
          )
        ),

        Container( //Quotes
          child: ValueListenableBuilder(
            valueListenable: controller.valueNotifier,
            builder: (context, value, child) {
              if (controller.failure == null) {
                return QuoteWidget(quote: value.toString());
              }
              else {
                return const QuoteWidget(
                  quote: ""
                );
              }
            }
          ),
        ),

        SizedBox(
          height: 30,
        ),

        //Bookings
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shadowColor: Colors.blueAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
                ),
              minimumSize: Size(100, 40),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/PdashtoBooking');
            },
            child: Text("Book an appointment",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14
              )
            ),
          )
        ),

        //Profile
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shadowColor: Colors.blueAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
                ),
              minimumSize: Size(100, 40),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/PdashtoProfile');
            },
            child: Text("Edit Details",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14
              )
            ),
          )
        ),


        //Chat
                Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.white,
              shadowColor: Colors.blueAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
                ),
              minimumSize: Size(100, 40),
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/DdashtoChats');
            },
            child: Text("Chat to a GP now",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14
              )
            ),
          )
        ),
      ],
      ),
    );
  }
}