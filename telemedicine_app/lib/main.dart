import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

<<<<<<< HEAD

//REGO PAGE
const List<Widget> Role = <Widget>[
  Text('Patient'),
  Text('Doctor')
];

const List<Widget> Gender = <Widget>[
  Text('Male'),
  Text('Female'),
  Text('Other')

];
=======

const List<String> role = <String>['Patient','Doctor'];


>>>>>>> 9e64a3b7c17813293058aa81e1ad0ea1bc2664ba
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
<<<<<<< HEAD
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child: RegistrationPage()),
=======
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(child: MyCustomForm()),
>>>>>>> 9e64a3b7c17813293058aa81e1ad0ea1bc2664ba
      ),
    );
  }
  
}


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

<<<<<<< HEAD
class _RegistrationPageState extends State<RegistrationPage>{
  final List<bool> _selectedRole = <bool>[true, false];
=======
class _MyCustomFormState extends State<MyCustomForm>{
  TextEditingController selectedRole=new TextEditingController();
>>>>>>> 9e64a3b7c17813293058aa81e1ad0ea1bc2664ba
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
<<<<<<< HEAD
    final response = await http.post(Uri.parse("http://localhost:8080/api/v1/register"), body: {
	    //"role": _selectedRole,
      "firstName": firstName.text,
      "lastName": lastName.text,
      //"Gender":_selectedGender,
      "mobile":phoneNumber.text,
=======
    final response = await http.post(Uri.parse("http://localhost:8081/api/v1/register"),  headers: {"Content-Type": "application/json"}, body: jsonEncode({
	    "role": selectedRole.text,
      "firstName": firstName.text,
      "lastName": lastName.text,  
      "mobileNumber":phoneNumber.text,
>>>>>>> 9e64a3b7c17813293058aa81e1ad0ea1bc2664ba
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
<<<<<<< HEAD
          child: ToggleButtons(isSelected: _selectedRole,
          onPressed: (int index) {
            setState(() {
              for(int i = 0; i < _selectedRole.length; i++){
                _selectedRole[i] = i == index;
              }
            });
            //Set up for pushing user to next screen
            //Navigator.pushNamed(context, '/patientprofile');
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
=======
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
                selectedRole.text = value;
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

>>>>>>> 9e64a3b7c17813293058aa81e1ad0ea1bc2664ba
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

