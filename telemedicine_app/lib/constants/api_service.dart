// import 'dart:developer';

// import 'package:http/http.dart' as http;

// import "package:telemedicine_app/constants/app_constants.dart";
// import "package:telemedicine_app/modules/profile/models/patients_models.dart";

// //Create different classes in order to get different things
// class APIservice {
//   Future<List<UserModel>?> getDoctors() async {
//     try {
//       var url = Uri.parse(ApiConstants.baseURL + ApiConstants.AppointmentEnd);
//       var response = await http.get(url);

//       if (response.statusCode == 200) {
//         List<userModel> _model = userModelFromJson(response.body);
//         return _model; 
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }