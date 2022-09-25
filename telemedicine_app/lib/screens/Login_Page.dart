import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ionicons/ionicons.dart';


class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login>{
  TextEditingController Username = TextEditingController();

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

                  //temp If statement until login page is intergrated
                  //Check the account Info If Doctor Sent to Doctor dashboard
                  if( !Username.text.contains("@") ){
                    Fluttertoast.showToast(msg: "Please Enter valid email");
                  }
                  else{
                      if(Username.text.contains("doctor") && Username.text.contains("@")){
                      Navigator.pushNamed(context, '/LogintoDDashboard');
                    }
                    //Check the account Info If Patient Sent to Paitent dashboard
                    else
                    {
                      Navigator.pushNamed(context, '/LogintoPDashboard');
                    }
                  }
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
