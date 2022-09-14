//You can put different widegts in here so that we may use it in other files
import 'package:flutter/material.dart';


//Dropdown Role

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Doctor"),value: "Doctor"),
    DropdownMenuItem(child: Text("Patient"),value: "Patient"),
  ];
  return menuItems;
}

