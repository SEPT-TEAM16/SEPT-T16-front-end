// To parse this JSON data, do
//
//     final getTimes = getTimesFromJson(jsonString);

import 'dart:convert';

List<GetTimes> getTimesFromJson(String str) => List<GetTimes>.from(json.decode(str).map((x) => GetTimes.fromJson(x)));

String getTimesToJson(List<GetTimes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetTimes {
    GetTimes({
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
        required this.getTimeDoB,
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
    String getTimeDoB;

    factory GetTimes.fromJson(Map<String, dynamic> json) => GetTimes(
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
        getTimeDoB: json["doB"],
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
        "doB": getTimeDoB,
    };
}
