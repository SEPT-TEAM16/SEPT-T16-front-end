import 'package:flutter/material.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});

  @override
  State<PatientProfile> createState() => PatientProfileState();
}

class PatientProfileState extends State<PatientProfile>{
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        const Text("Enter your selection"),

        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 75,

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
          
          //indent please
          child: Text("General Account Information",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16
            )
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('Change Details'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            //PERSONAL INFORMATION
                            Text('PERSONAL INFORMATION'),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField( //change to date pickerk
                              decoration: InputDecoration(
                                labelText: 'Date of Birth',
                                icon: Icon(Icons.message ),
                              ),
                            ),
                            //CONTACT INFORMATION
                            Text('CONTACT INFORMATION'),

                            TextFormField( 
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                              ),
                            ),
                            TextFormField( 
                              decoration: InputDecoration(
                                labelText: 'Address',
                              ),
                            ),

                            //PASSWORD
                            Text('NEW PASSWORD'),

                            TextFormField( 
                              decoration: InputDecoration(
                                labelText: 'New Password',
                              ),
                            ),
                            TextFormField( 
                              decoration: InputDecoration(
                                labelText: 'Retype New Password',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     actions: [
                      RaisedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            // NEED TO DO POST HERE
                          })
                    ],
                  );
                });
          },
        ),
        ),

        //Conditions
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 75,

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

            child: Text("Medical Conditions",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16
              )
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: Text('Enter your medical conditions'),

                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Text('Conditions:'),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter into here',
                              )
                            )
                          ]
                        )
                      )
                    ),
                    actions: [
                      RaisedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          //NEED TO POST
                        }
                      )
                    ],
                  );
                }
              );
            }
          )
        ),
        
        //Medication
        Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 75,

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

            child: Text("Medication",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16
              )
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,

                    title: Text('Enter your existing Medications',
                      
                    ),

                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            Text('Medication:'),

                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Enter into here',
                              )
                            )
                          ]
                        )
                      )
                    ),
                    actions: [
                      RaisedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          //NEED TO POST
                        }
                      )
                    ],
                  );
                }
              );
            }
          )
        ),
      ],
    );
  }
}