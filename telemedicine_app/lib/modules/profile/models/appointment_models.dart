// To parse this JSON data, do
//
//     final appInfo = appInfoFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class AppInfo {
    AppInfo({
        required this.appointmentId,
        required this.appointmentStartDate,
        required this.appointmentEndDate,
        required this.patient,
        required this.doctor,
        required this.appointmentStatus,
    });

    int appointmentId;
    DateTime appointmentStartDate;
    DateTime appointmentEndDate;
    Doctor patient;
    Doctor doctor;
    String appointmentStatus;

    factory AppInfo.fromRawJson(String str) => AppInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        appointmentId: json["appointmentId"],
        appointmentStartDate: DateTime.parse(json["appointmentStartDate"]),
        appointmentEndDate: DateTime.parse(json["appointmentEndDate"]),
        patient: Doctor.fromJson(json["patient"]),
        doctor: Doctor.fromJson(json["doctor"]),
        appointmentStatus: json["appointmentStatus"],
    );

    Map<String, dynamic> toJson() => {
        "appointmentId": appointmentId,
        "appointmentStartDate": appointmentStartDate.toIso8601String(),
        "appointmentEndDate": appointmentEndDate.toIso8601String(),
        "patient": patient.toJson(),
        "doctor": doctor.toJson(),
        "appointmentStatus": appointmentStatus,
    };
}

class Doctor {
    Doctor({
        required this.userId,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.password,
        required this.doB,
        required this.accountActive,
        required this.address,
        required this.mobileNumber,
        required this.role,
        required this.doctorDoB,
    });

    int userId;
    String email;
    String firstName;
    String lastName;
    String password;
    String doB;
    bool accountActive;
    String address;
    String mobileNumber;
    String role;
    String doctorDoB;

    factory Doctor.fromRawJson(String str) => Doctor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        userId: json["userId"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        password: json["password"],
        doB: json["DoB"],
        accountActive: json["accountActive"],
        address: json["address"],
        mobileNumber: json["mobileNumber"],
        role: json["role"],
        doctorDoB: json["doB"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "password": password,
        "DoB": doB,
        "accountActive": accountActive,
        "address": address,
        "mobileNumber": mobileNumber,
        "role": role,
        "doB": doctorDoB,
    };
}
