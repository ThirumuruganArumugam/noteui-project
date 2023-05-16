import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationConfig.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import 'package:social_media/Helpers/Utitilites/Utilities.dart';
import '../../BOs/PostBO/PostBO.dart';
import '../../Helpers/Mixins/ToastMixin.dart';
import 'LandingScreenModel.dart';

class LandingScreenVM extends LandingScreenModel {
  /* Create a constructore to set the initial range values for observable variable  */
  LandingScreenVM() {
    try {
      // Set the userdetails name as "" and age as null
      userdetails =
          PostBO(title: '', description: '', id: null, date: DateTime.now());
    } catch (e) {
      // Handle Exception
      e.writeExceptionData();
    }
  }

  /* Create a retriveUserData method to update the userdetails and toast message*/
  Future<void> fetchPost() async {
    try {
      // Invoke the retriveUserData service method and store the result in a variable
      var result =
          await platformSharedPreferenceService.retrieveData(title: 'name');

      // Assign the result as "userdetails" observable variable.
      setUserDetails(
          userdetails: PostBO(
              title: result.content['title'],
              description: result.content['description'],
              date: DateTime.now(),
              id: null));

      // Check, if the result's name equals "" and age equals null
      result.content['title'] == '' || result.content['description'] == null
          ?
          // If yes, Add the toastmessage inside the AddToast event
          setToastEvent(
              event: AddToast(toastMessage: "No data available to fetch"))
          :
          // If no, return null
          null;
    } catch (e) {
      // Handle exception
      e.writeExceptionData();
    }
  }

  void navigatetoCreatePostScreen() {
    navigationStream.add(
        NavigatorPush(pageConfig: Pages.CreatePostScreenConfig, data: null));
  }
}
