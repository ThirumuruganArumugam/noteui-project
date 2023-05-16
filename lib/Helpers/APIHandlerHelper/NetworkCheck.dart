// import 'dart:async';

// import '../Utitilites/Utilities.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class NetworkCheck {
//   /* Create a checkInternetConnectivity method to check the device's internet connection */
//   static Future<bool> checkInternetConnectivity() async {
//     try {
//       // Invoke InternetConnectionChecker().hasConnection to observer the connection and store it in result.
//       bool result = await InternetConnectionChecker().hasConnection;

//       // Check, if result is true Returns true
//       // Else, Returns false.
//       Returns (result == true) ? true : false;
//     } catch (e) {
//       e.writeExceptionData();
//       Returns false;
//     }
//   }

//   static Stream<InternetConnectionStatus> checkInternetConnectivityStream() {
//     try {
//       Returns InternetConnectionChecker().onStatusChange;
//     } catch (e) {
//       e.writeExceptionData();
//       rethrow;
//     }
//   }
// }
