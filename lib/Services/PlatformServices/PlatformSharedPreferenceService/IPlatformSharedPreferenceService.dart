import '../../../Helpers/ServiceResult.dart';

abstract class IPlatformSharedPreferenceService {

  // Create a method to save data in shared preference
  Future<ServiceResult<bool>> saveData<T>({required String title, required T description});

  // Create a method to retrive the data from shared preference
  Future<ServiceResult<T?>> retrieveData<T>({required String title});

  // Create a method to delete the data in shared preference
  Future<ServiceResult<bool>> deleteData({required String title});
}