import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:telemedicine_app/main.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

//We build all of our widgets here to call into main :)

//rego
const List<String> role = <String>['Patient','Doctor'];

// Avaliabilities Time 7am to 5pm in 24hour time
const List<String> Times = <String>['07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00'];

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm>{
  TextEditingController selectedRole=new TextEditingController();
  TextEditingController firstName=new TextEditingController();
  TextEditingController lastName=new TextEditingController();
  TextEditingController _Date = TextEditingController();
  TextEditingController phoneNumber=new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController city=new TextEditingController();
  TextEditingController postCode=new TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  var _PasswordController = TextEditingController();
  bool _obscureText = true;
  String dropdownValue = role.first;
  get child => null;

  Future _submit() async {
    final response = await http.post(Uri.parse("http://localhost:8081/api/v1/register"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({
	    "role": selectedRole.text,
      "firstName": firstName.text,
      "lastName": lastName.text,  
      "mobileNumber":phoneNumber.text,
	    "email": email.text,
      "address": "${address.text} ${city.text} ${postCode.text}",
      "password": _pass.text, 
      "DoB": _Date.text,
      "accountActive": true

    }));
     var data = json.decode(response.body);
     if(data == "Success"){
        Fluttertoast.showToast(msg: "Registration Successfull");
     } else{
      Fluttertoast.showToast(msg: "Registration Failed");
     }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text("What is your role?"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: 
          DropdownButton<String>(
            value: dropdownValue,
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
                dropdownValue = value!;
                selectedRole.text = dropdownValue;
              });
            },
            items: role.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
          );
        }).toList(),
        )
        ),

        // Personal Information
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Title(color: Colors.black, child: const Text("Personal Information"),
          )
        ),
        //First name
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: firstName,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'First Name',
            ),
          ),
        ),
        //Last name
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: lastName,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Last Name',
            ),
          ),
        ),
        //Date of Birth
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: _Date,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Date Of Birth',
            ),
              onTap: () async{
              DateTime? pickedDate = await showDatePicker( context: context,initialDate: DateTime.now(),firstDate: DateTime(1900),lastDate: DateTime(2101));
              if(pickedDate != null){
                setState(() {
                  DateTime finaldate= DateTime.parse(pickedDate.toString());
                  String convertedDate = DateFormat("yyyy-MM-dd").format(finaldate);
                  _Date.text = convertedDate;
                });
              }      
        }
        ),
        ),

        // CONTACT INFORMATION SECTION
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Title(color: Colors.black, child: const Text("Contact Information"),)
        ),

        // Phone Number
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: phoneNumber,
            inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Phone Number',
            ),
          ),
        ),
        
        // Email Address
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
          controller: email,
          decoration:const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Email Address',
            ),
            validator: (value) {
              if(value == null || value.isEmpty || !value.contains('@') || !value.contains('.')){
                return 'Invalid Email';
              }
              return null;
            },
            ),
        ),
        // Address
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: address,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Address',
            ),
          ),
        ),
        // City
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: city,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'City',
            ),
          ),
        ),
        // Postal Code
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: postCode,
            inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Postal Code',
            ),
          ),
        ),

        //Password Section
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Title(color: Colors.black, child: const Text("Password"),)
        ),
        //Password
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: _pass,
            validator: (val){
              if(val!.isEmpty) {
                return 'Empty';
              }
              return null;
            },
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Password',
              suffixIcon: IconButton( icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: (() {
                setState(() {
                  _obscureText = !_obscureText;
                });
              })),
            ),
          ),
        ),
        // Re-Enter Password
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
             controller: _confirmPass,
              validator: (val){
                if(val!.isEmpty) {
                  return  "Empty";
                }
                if(val != _pass.text) {
                  return 'Not Match';
                }
                return null;
                },
            obscureText: _obscureText,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Re-Enter Password',
              suffixIcon: IconButton( icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: (() {
                setState(() {
                  _obscureText = !_obscureText;
                });
              })),
            ),
          ),
        ),
        //Submit Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          child: ElevatedButton(
            onPressed: (){  
            _submit();     
            Navigator.pushNamed(context, '/RegotoProfile');
          },
          child: Text("Submit"),
        ),
        )
      
  ],
  );
  
}
}


//Doctor Booking
class DoctorBooking extends StatefulWidget {
  const DoctorBooking({super.key});

  @override
  State<DoctorBooking> createState() => DoctorBookingState();
}

class DoctorBookingState extends State<DoctorBooking>{

//Builds DoctorBookingState Widget
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text("Upcoming bookings"),

        //Different Fields
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 16),
          child: TextFormField(
            //controller: postCode,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Doctors Bookings',
            ),
          ),
        ),
      ],
    );
  }
}

//Login Page
class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login>{
 @override
  Widget build(BuildContext context) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Icon(Ionicons.medkit, size: 100, color: Colors.red),
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            Container(
              margin:EdgeInsets.all(30.0),
              height: 40,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/LogintoPDashboard');
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Container(child: TextButton( 
              onPressed:(){       
                Navigator.pushNamed(context, '/LogintoRego');
            
              },
            child: Text("Don't have an account?  Register Now"),),)
          ],
        );
  }
}

//Doctors Dashboard
class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => DoctorDashboardState();
}

class DoctorDashboardState extends State<DoctorDashboard>{
  // TextEditingController date = new TextEditingController();


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

//Doctors Availabilies
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
              Navigator.pushNamed(context, '/DdashBoard');
            },
            child: Text("Submit Avalibities"),
          ),
      )

      ],
    );
  }
}

//Doctors Chat
class DoctorChat extends StatefulWidget {
  const DoctorChat({super.key});

  @override
  State<DoctorChat> createState() => DoctorChatState();
}

class DoctorChatState extends State<DoctorChat>{
  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        //Different Fields
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            //controller: postCode,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Chat',
            ),
          ),
        ),
      ],
    );
  }
}
//Patients Dashboard
class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => PatientDashboardState();
}

class PatientDashboardState extends State<PatientDashboard>{
  // TextEditingController date = new TextEditingController();

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

//Patients Profile
class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => PatientProfileState();
}

class PatientProfileState extends State<PatientProfile>{
  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text("Enter your selection"),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            //controller: postCode,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'profile',
            )
          ),
        ),

        //Different Fields
        
      ],
    );
  }
}

//Patients Chat
class PatientChat extends StatefulWidget {
  const PatientChat({super.key});

  @override
  State<PatientChat> createState() => PatientChatState();
}

class PatientChatState extends State<PatientChat>{
  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text("Enter your selection"),

        //Different Fields
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            //controller: postCode,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'chat',
            )
          ),
        ),
      ],
    );
  }
}

//Patients Booking

// HARDCODED DOCTORS AND TIMES FOR TESTING
const List<String> Doctorlist = <String>['Doctor 1', 'Doctor 2', 'Doctor 3']; // temporary Doctor names
const List<String> TimeList = <String>['11:00', '3:00', '3:30']; // Temporary Times

//Strings for the dropdown values
String doctorDropDownValue = Doctorlist.first;
String timeDropDownValue = TimeList.first;

class PatientBooking extends StatefulWidget {
  const PatientBooking({super.key});

  @override
  State<PatientBooking> createState() => PatientBookingState();
}

class PatientBookingState extends State<PatientBooking>{
  TextEditingController date = new TextEditingController();
  TextEditingController doctorName = new TextEditingController();
  TextEditingController time = new TextEditingController();
  get child => null;

Future _submitBooking() async { //                                           v get
    final response = await http.post(Uri.parse("http://localhost:8081/api/v1/booking"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({
	    "date": date.text,
      "doctor": doctorName.text,
      "time": time.text,
      "accountActive": true
    }));
     
  }

  //Building the Widget
  @override
  Widget build(BuildContext context) {

  return Column(
        children: <Widget>[
          const Text("Enter your selection"),

          //Date Picker
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: date,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Appointment Times'
              ),
              onTap: () async{
                DateTime? pickedDate = await showDatePicker( context: context,initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2101));
                if (pickedDate != null){
                  setState((){
                    DateTime finaldate = DateTime.parse(pickedDate.toString());
                    String convertedDate = DateFormat("yyyy-MM-dd").format(finaldate);
                    date.text = convertedDate;
                  }
                  );
                }
              }
            )
          ),

          //Doctor List

          Container(
            child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownButton<String>(
              value: doctorDropDownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepOrange),
              underline: Container(
                height: 2,
                color: Colors.deepOrangeAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  doctorDropDownValue = value!;
                  doctorName.text = doctorDropDownValue;
                }
                );
              },
              items: Doctorlist.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
              }).toList(),
            ),
          ),
          ),
          

          //Available Time
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownButton<String>(
              value: timeDropDownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepOrange),
              underline: Container(
                height: 2,
                color: Colors.deepOrangeAccent,
              ),
              onChanged: (String? value) {
                setState(() {
                  timeDropDownValue = value!;
                  time.text = timeDropDownValue;
                }
                );
              },
              items: TimeList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                  );
              }).toList(),
            ),
          ),

          //Submit Button
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: (){
                _submitBooking();
              },
              child: Text("Submit Booking"),
            )
          )
        ],
      );
    }
}
