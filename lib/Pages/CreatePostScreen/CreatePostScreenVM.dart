import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationConfig.dart';
import 'package:social_media/Helpers/Utitilites/Utilities.dart';

import '../../BOs/PostBO/PostBO.dart';
import '../../Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import '../../Helpers/Mixins/TextFieldMixin.dart';
import 'CreatePostScreenModel.dart';


// Create a class named CalculationScreenVM wich extends the class CalculationScreenModel
class CreatePostScreenVM extends CreatePostScreenModel {
  // Create a constructor include the required parameter
  CreatePostScreenVM() {
    // assign the value of counter
      try {
      // Set the userdetails name as "" and age as null
      userdetails = PostBO(title: '', description: '', id: null, date: DateTime.now());
    } catch (e) {
      // Handle Exception
      e.writeExceptionData();
    }
  }
  
  Future<void> saveUserData(PostBO PostBO) async {
    try {
      // Invoke the saveUserData service method and pass the "name" and "age" observable variable
      await platformSharedPreferenceService.saveData(
          title: 'name', description: PostBO);
    } catch (e) {
      // Handle Exception
      e.writeExceptionData();
    }
  }

  void updatetitle(String title) {
    try {
      // Assign the name as "name" observable variable.
      settitle(title: title);

      // Add the name inside the AddText event.
      setTitleValue(event: AddText(data: title));
    } catch (e) {
      // Handle Exception
      e.writeExceptionData();
    }
  }

  void updateDescription(String description) {
    try {
      // Assign the name as "name" observable variable.
      setDescription(description: description);

      // Add the name inside the AddText event.
      setDescriptionValue(event: AddText(data: title));
    } catch (e) {
      // Handle Exception
      e.writeExceptionData();
    }
  }

// Create a void function named as back
  void back() {
    // Add the navigator pop method to navigation stream.
    navigationStream.add(NavigatorPop());
  }

    void navigatetoResponseScreen(){
    navigationStream.add(NavigatorPush(pageConfig: Pages.ResponseScreenconfig.data, data: null));
  }
}
