import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:telemedicine_app/globals/global_variable.dart' as globals;
class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}


class _Login extends State<Login>{
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  Map<String, dynamic> payload = Map<String, dynamic>();
  //Map<String, dynamic> tokenDecoded = Map<String, dynamic>(); Not sure if needed

Future findPatientId() async{
  var response = await http.get(Uri.parse("http://host.docker.internal:8080/api/v1/get-patient/${globals.email}"), headers: {"Content-Type": "application/json", "Authorization":"Bearer ${globals.jwtToken}"});
  globals.userId = response.body;
}

Future findDoctorId() async{
  var response = await http.get(Uri.parse("http://host.docker.internal:8080/api/v1/get-doctor/${globals.email}"), headers: {"Content-Type": "application/json", "Authorization":"Bearer ${globals.jwtToken}"});
  globals.userId = response.body ;
}

String jToken = "";

Future submitLoginDetails() async{
  var response = await http.post(Uri.parse("http://host.docker.internal:8080/api/v1/authenticate"),  headers: {"Content-Type": "application/json"}, body: jsonEncode(
  {
      "username": Username.text, 
      "password": Password.text
  }));
  if (response.statusCode == 200){
    var temp = json.decode(response.body);
    jToken = temp.toString();
    globals.jwtToken = temp["jwtToken"];
    payload = Jwt.parseJwt(response.body);
    _decodeJWT(globals.jwtToken);
    // Clear inputs so when you backtrack its not there anymore
    Username.text = "";
    Password.text = "";
    if(payload.containsValue("ROLE_PATIENT")){
      findPatientId();
      globals.role = "ROLE_PATIENT";
      Navigator.pushNamed(context, '/LogintoPDashboard');
    }
    else if (payload.containsValue("ROLE_DOCTOR")){
      findDoctorId();
      globals.role = "ROLE_DOCTOR";
      Navigator.pushNamed(context, '/LogintoDDashboard');
    }
  }
  else{
    Fluttertoast.showToast(msg: "Username or password is incorrect");
  }
  
}

//Getting user Email through decoding JWT token
Map<String, dynamic> parseJwt(String jwtToken) {
  final parts = jwtToken.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}


String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }
  return utf8.decode(base64Url.decode(output));
}

_decodeJWT(String Token){
  Map<String, dynamic> tokenDecoded = parseJwt(Token);
  globals.email = tokenDecoded['sub'];
}



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
                controller: Username,
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
                controller: Password,
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
                  submitLoginDetails();
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
