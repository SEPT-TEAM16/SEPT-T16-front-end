import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

const List<Widget> Role = <Widget>[
  Text('Patient'),
  Text('Doctor')
];

const List<Widget> Gender = <Widget>[
  Text('Male'),
  Text('Female'),
  Text('Other')
];
void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'ND Telemedicine';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text(appTitle),),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child: MyCustomForm()),
      ),
    );
  }
  
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm>{
  final List<bool> _selectedRole = <bool>[true, false];
  TextEditingController firstName=new TextEditingController();
  TextEditingController lastName=new TextEditingController();
  final List<bool> _selectedGender = <bool>[false, false, false];
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
  get child => null;

  Future _submit() async {
    final response = await http.post(Uri.parse("http://localhost:8080/api/v1/register"), body: {
	    "role": _selectedRole,
      "firstName": firstName.text,
      "lastName": lastName.text,
      "Gender":_selectedGender,
      "mobile":phoneNumber.text,
	    "email": email.text,
      "address": "${address.text} ${city.text} ${postCode.text}",
      "password": _pass.text, 

    });
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
          child: ToggleButtons(isSelected: _selectedRole,
          onPressed: (int index) {
            setState(() {
              for(int i = 0; i < _selectedRole.length; i++){
                _selectedRole[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.blue[700],
          selectedColor: Colors.white,
          fillColor: Colors.blue[200],
          color: Colors.blue[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          children: Role.toList(),),
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
        //Gender
        const Text("Gender"),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ToggleButtons(isSelected: _selectedGender,
          onPressed: (int index) {
            setState(() {
              for(int i = 0; i < _selectedGender.length; i++){
                _selectedGender[i] = i == index;
              }
            });
          },
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          selectedBorderColor: Colors.blue[700],
          selectedColor: Colors.white,
          fillColor: Colors.blue[200],
          color: Colors.blue[400],
          constraints: const BoxConstraints(
            minHeight: 40.0,
            minWidth: 80.0,
          ),
          children:  Gender.toList(),),
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

