class ApiConstants {
  static String baseURL = 'http://host.docker.internal:8080/api/v1';
  static String RegistrationEnd = '/register';
  static String AppointmentEnd = '/create-appointment';
  static String DoctorAvailabilities = '/avalibities';
  static String AppoinmentINFO = '/get-appointments';

  static String GetDoctor = '/get-doctor'; //+ /userid
  static String GetAdmin = '/get-admin'; // + /userId
  static String GetPatient = '/get-patient'; // + /userId

  static const phraseEndpoint = 'https://api.kanye.rest';

}
