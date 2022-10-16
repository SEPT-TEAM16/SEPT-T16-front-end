import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine_app/widgets/quotes/core/locator.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget_controller.dart';
import 'package:telemedicine_app/globals/global_variable.dart' as globals;

class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => DoctorDashboardState();
}

class DoctorDashboardState extends State<DoctorDashboard>{
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

  //Getting Doctor Name
  String dName = 'Dr ' + 'John ' + 'He'; //string should be first_name + last_name under doctors
  
  //Getting Date
  var dt = DateTime.now();
  //formating date
  String cdate2 = DateFormat("MMMM, dd, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          child: Text(
            dName,
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
            cdate2,
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

        SizedBox( //SPACER
          height: 100,
        ),

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
              Navigator.pushNamed(context, '/DdashtoAvailability');
            },
            child: Text("Adjust Availability",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14
              )
            ),
          )
        ),

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
              Navigator.pushNamed(context, '/DdashtoBooking');
            },
            child: Text("Bookings",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14
              )
            ),
          )
        ),

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
            child: Text("Patient Chat",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14
              )
            ),
          )
        )
      ],
    );
  }
}