import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}


class _Login extends State<Login>{
  TextEditingController Username = TextEditingController();
  TextEditingController Password = TextEditingController();
  Map<String, dynamic> payload = Map<String, dynamic>();

Future submitLoginDetails() async{
  var response = await http.post(Uri.parse("http://10.0.2.2:8080/api/v1/authenticate"),  headers: {"Content-Type": "application/json"}, body: jsonEncode(
  {
      "username": Username.text, 
      "password": Password.text
  }));
  if (response.statusCode == 200){
    payload = Jwt.parseJwt(response.body);
    if(payload.containsValue("ROLE_PATIENT")){
      Navigator.pushNamed(context, '/LogintoPDashboard');
    }
    else if (payload.containsValue("ROLE_DOCTOR")){
      Navigator.pushNamed(context, '/LogintoDDashboard');
    }
  }
  else{
    Fluttertoast.showToast(msg: "Username or password is incorrect");
  }
  
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
