import 'dart:convert';

//once we get the gets we make models.

AppointmentINFO AppfromJson(String str) => AppointmentINFO.fromJson(json.decode(str));

class AppointmentINFO {
  
  AppointmentINFO({
    required this.appointmentStartDate, //ask lucas how to ignore null

  });

  String appointmentStartDate;

  factory AppointmentINFO.fromJson(Map<String, dynamic> json) => AppointmentINFO(
    appointmentStartDate: json["appointmentStartDate"],
  );

  Map<String, dynamic> toJson() => {
    "appointmentStartDate": appointmentStartDate,
  };
}

