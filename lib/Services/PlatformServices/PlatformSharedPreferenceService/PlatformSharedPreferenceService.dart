import 'dart:convert';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media/Helpers/Utitilites/Utilities.dart';
import '../../../Helpers/ServiceResult.dart';
import 'IPlatformSharedPreferenceService.dart';

/* Create a PlatformUserPreferenceService that extends the interface */
class PlatformSharedPreferenceService extends IPlatformSharedPreferenceService {
  @override

/* Create a method saveData() to store the data in shared preference and pass the key and value as parameter */
  Future<ServiceResult<bool>> saveData<T>(
      {required String title, required T description}) async {
    try {
// Create a map 'sharedPreferenceData' and store the value against key key
      Map<String, dynamic> sharedPreferenceData = {
        title: description,
      };

      // Serialize the sharedPreferenceData and store the result in a 'encodedData' variable
      String encodedData = JsonMapper.serialize(sharedPreferenceData);

// Set the encodedData in UserPreferences against the key using setString().
      bool result = await SharedPreferences.getInstance()
          .then((value) => value.setString(title, encodedData));

// Check, if the result is equals true
      return result == true
          ? // Return true
          ServiceResult(statusCode: ServiceStatusCode.OK, content: result)
          :
// Return false
          ServiceResult(
              statusCode: ServiceStatusCode.SystemException, content: false);
    } catch (e) {
      // Invoke writeExceptionData()
      e.writeExceptionData();

      // Return false
      return ServiceResult(
          statusCode: ServiceStatusCode.SystemException, content: false);
    }
  }

  @override

  /* Create a method retriveData() to retrive the data and pass the key as parameter*/
  Future<ServiceResult<T?>> retrieveData<T>({required String title}) async {
    try {
      // Retrieve the data by passing key to getString() and store the result in retrivedData
      String retrivedData = await SharedPreferences.getInstance()
          .then((value) => value.getString(title) ?? "");

      // Store the key and retrieved data in 'map' variable of type map
      Map<String, dynamic> map = {title: retrivedData};

      // Deserialize the map and store it decodedData variable
      var decodedData =
          JsonMapper.deserialize<Map<String, dynamic>>(jsonEncode(map));

      // Check, if the decodedData not equals to null
      if (decodedData != null) {
        // Check if decodedData's value is empty
        if (decodedData[title] == '') {
          // Return the decodedData's value
          return ServiceResult(
              statusCode: ServiceStatusCode.OK, content: decodedData[title] as T);
        } else {
          // Store the decodedData's value in 'data'
          var data = decodedData[title];

          // Decode the data and store it in 'jsonData' variable
          var jsonData = jsonDecode(data);

          // Return the jsonData's value
          return ServiceResult(
              statusCode: ServiceStatusCode.OK, content: jsonData[title] as T);
        }
      } else {
        // Return null
        return ServiceResult(
            statusCode: ServiceStatusCode.NoContent, content: null);
      }
    } catch (e) {
      // Invoke writeExceptionData()
      e.writeExceptionData();

      // Return null.
      return ServiceResult(
          statusCode: ServiceStatusCode.SystemException, content: null);
    }
  }

  @override

  /* Create a method deleteData() to delete the data and pass the key as parameter*/
  Future<ServiceResult<bool>> deleteData({required String title}) async {
    try {
      // Delete the data by passing key to remove() and store result in 'result' variable
      bool result = await SharedPreferences.getInstance()
          .then((value) => value.remove(title));

      return result
          ?

          // Return true
          ServiceResult(statusCode: ServiceStatusCode.OK, content: result)
          :

          // Return false
          ServiceResult(
              statusCode: ServiceStatusCode.SystemException, content: result);
    } catch (e) {
      // Invoke writeExceptionData()
      e.writeExceptionData();

      // Return false
      return ServiceResult(
          statusCode: ServiceStatusCode.SystemException, content: false);
    }
  }
}