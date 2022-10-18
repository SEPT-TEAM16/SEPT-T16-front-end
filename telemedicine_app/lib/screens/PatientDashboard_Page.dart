import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:telemedicine_app/widgets/quotes/core/locator.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget.dart';
import 'package:telemedicine_app/widgets/quotes/quotes_widget_controller.dart';
import 'package:telemedicine_app/globals/global_variable.dart';



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

  //Upcoming Assessments widget => Should call for the next appointment for the patient.
  var textCols = Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Text(
        'Upcoming Appointment',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontSize: 20,
        ),
      ),

      Text(
        '30 ' + 'Friday ' + '9:00 AM', //GET TIME
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          fontSize: 15,
        ),
      ), 

      Text(
        'Dr. ' + 'John ' + 'He ', //GET NAME
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          fontSize: 15,
        ),
      ), 
      
    ],
  );

  //For medicine box
  var profMedInfo = Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        '2 everyday', //pull if we have to
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontSize: 13,
        ),
      ),
      Text(
        '1 morning', //pull if we have to
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontSize: 13,
        ),
      ),
      Text(
        '1 night', //pull if we have to
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          fontSize: 13,
        ),
        ),
    ],
  );
  //For medicine box
  var profMed = Row(
    children: [
      Expanded(
        child: profMedInfo,
      ),
      Icon(
        Icons.medication_liquid_outlined,
        size: 75,
        color: Colors.white,
      ),
    ],
  );

    return Container( 
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

        InkWell( //please fix indentation

        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 26),
          height: 125,
          width: MediaQuery.of(context).size.width * 0.95,

          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              textCols,
              Icon(
                Icons.calendar_month, 
                color: Colors.white,
                size: 100,
              ),
            ],
          ),


        ),
        onTap: (() {
          Navigator.pushNamed(context, '/PdashtoBooking');
        }),
        ),


        SizedBox(
          height: 30,
        ),

        InkWell(
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          height: 130,
          width: MediaQuery.of(context).size.width * 0.45,

          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),

          child: Column(
            children: [
              Text(
                'Phosparin', //Get madicine name
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  fontSize: 16,
                ),
              ),
              profMed //we would have to pull other stuff
            ],
          ),
        ),

        onTap: (() {
          Navigator.pushNamed(context, '/PdashtoMed');
        }),
        ),

        //Edit Details
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
            child: Text(
              "Edit Details",
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
