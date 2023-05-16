import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationConfig.dart';

import '../../Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import 'ResponseScreenModel.dart';

// Create a class named CalculationScreenVM wich extends the class CalculationScreenModel
class ResponseScreenVM extends ResponseScreenModel {
// Create a void function named as back
  void backToLandingScreen() {
    // Add the navigator pop method to navigation stream.
    navigationStream.add(NavigatorPopAndRemoveUntil(
        pageConfig: Pages.ResponseScreenconfig,
        removeUntilpageConfig: Pages.LandingScreenConfig,
        data: null));
  }
}
