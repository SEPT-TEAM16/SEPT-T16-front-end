import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:telemedicine_app/main.dart';
//We build all of our widgets here to call into main :)

//rego
const List<String> role = <String>['Patient','Doctor'];

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
            _submit()       ;     
          },
          child: Text("Submit"),
        ),
        )
      
  ],
  );
  
}
}


//Doctor Booking

// HARDCODED DOCTORS AND TIMES FOR TESTING
const List<String> Doctorlist = <String>['Doctor 1', 'Doctor 2', 'Doctor 3'];
const List<String> TimeList = <String>['11:00', '3:00', '3:30'];

//Strings for the dropdown values
String doctorDropDownValue = Doctorlist.first;
String timeDropDownValue = TimeList.first;

class DoctorBooking extends StatefulWidget {
  const DoctorBooking({super.key});

  @override
  State<DoctorBooking> createState() => DoctorBookingState();
}

class DoctorBookingState extends State<DoctorBooking>{
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


//Builds DoctorBookingState Widget
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

        

        Padding(
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

//Login Page

//Doctors Dashboard
class DoctorDashboard extends StatefulWidget {
  const DoctorDashboard({super.key});

  @override
  State<DoctorDashboard> createState() => DoctorDashboardState();
}

class DoctorDashboardState extends State<DoctorDashboard>{
  // TextEditingController date = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text("Dr John He"), //Need to find doctor name
        
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/DdashtoAvailability');
            },
            child: Text("Adjust Availability"),
          )
        ),

         Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/DdashtoBooking');
            },
            child: Text("Bookings"),
          )
        ),

         Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/DdashtoChats');
            },
            child: Text("Chats"),
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
              labelText: 'Monday',
            ),
          ),
        ),
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
// //Patients Dashboard
// class PatientDashboard extends StatefulWidget {
//   const PatientDashboard({super.key});

//   @override
//   State<PatientDashboard> createState() => PatientDashboardState();
// }

// class PatientDashboardState extends State<PatientDashboard>{
//   // TextEditingController date = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       children: <Widget>[
//         const Text("Enter your selection"),

//         //Different Fields
//         Padding(
          
//         )
//       ],
//     );
//   }
// }

// //Patients Profile
// class PatientProfile extends StatefulWidget {
//   const PatientProfile({super.key});

//   @override
//   State<PatientProfile> createState() => PatientProfileState();
// }

// class PatientProfileState extends State<PatientProfile>{
//   // TextEditingController date = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       children: <Widget>[
//         const Text("Enter your selection"),

//         //Different Fields
//         Padding(
          
//         )
//       ],
//     );
//   }
// }
// //Patients Chat
// class PatientChat extends StatefulWidget {
//   const PatientChat({super.key});

//   @override
//   State<PatientChat> createState() => PatientChatState();
// }

// class PatientChatState extends State<PatientChat>{
//   // TextEditingController date = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       children: <Widget>[
//         const Text("Enter your selection"),

//         //Different Fields
//         Padding(
          
//         )
//       ],
//     );
//   }
// }

// //Patients Booking
// class PatientBooking extends StatefulWidget {
//   const PatientBooking({super.key});

//   @override
//   State<PatientBooking> createState() => PatientBookingState();
// }

// class PatientBookingState extends State<PatientBooking>{
//   // TextEditingController date = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {

//     return Column(
//       children: <Widget>[
//         const Text("Enter your selection"),

//         //Different Fields
//         Padding(
          
//         )
//       ],
//     );
//   }
// }
