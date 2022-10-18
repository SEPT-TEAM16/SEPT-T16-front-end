import 'package:flutter/material.dart';

import 'package:telemedicine_app/Submit_Futures/PatientProfile_Page/futures.dart';


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

        //General Account Information
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
                              controller: first_Name,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField(
                              controller: last_Name,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                icon: Icon(Icons.email),
                              ),
                            ),
                            TextFormField( //change to date pickerk
                            controller: DOB,
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
                              controller: EmailAddress,
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
                              controller: NewPassword,
                              decoration: InputDecoration(
                                labelText: 'Retype New Password',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     actions: [
                      ElevatedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            submitGAI();
                            Navigator.pushNamed(context, '/PdashtoProfile');
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
                      ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/PdashtoProfile');
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
                      ElevatedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/PdashtoProfile');
                        }
                      )
                    ],
                  );
                }
              );
            }
          )
        ),

        //Medical Records
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
          
          //Medical record
          child: Text("Medical Record Information",
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
                    title: Text('Change Medical Record Details'),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            //Medicare No.
                            // Text('Medicare No.'),

                            TextFormField(
                              controller: MedicareNumber,
                              decoration: InputDecoration(
                                labelText: 'Medicare No. (Optional)',
                                icon: Icon(Icons.card_membership),
                              ),
                            ),
                            TextFormField(
                              controller: PatientWeight,
                              decoration: InputDecoration(
                                labelText: 'Weight',
                                icon: Icon(Icons.line_weight),
                              ),
                            ),
                            TextFormField( //change to date picker <=WHAT DO YOU MEAN LUCAS???
                              controller: PatientHeight,
                              decoration: InputDecoration(
                                labelText: 'Height',
                                icon: Icon(Icons.height),
                              ),
                            ),

                            TextFormField( 
                              controller: LocalGp,
                              decoration: InputDecoration(
                                labelText: 'Local GP',
                                icon: Icon(Icons.account_box),
                              ),
                            ),
                            TextFormField( 
                              controller: PrevHistory,
                              decoration: InputDecoration(
                                labelText: 'Previous Health History',
                              ),
                            ),
                            TextFormField( 
                              controller: PatientGender,
                              decoration: InputDecoration(
                                labelText: 'Gender',
                                icon: Icon(Icons.person),
                            ),
                            )
                          ],
                        ),
                      ),
                    ),
                     actions: [
                      ElevatedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            submitMR();
                            Navigator.pushNamed(context, '/PdashtoProfile');
                          })
                    ],
                  );
                });
          },
        ),
        ),


      ],
    );
  }
}