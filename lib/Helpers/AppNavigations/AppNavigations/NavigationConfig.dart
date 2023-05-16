// ignore_for_file: constant_identifier_names, file_names, non_constant_identifier_names

import '../../../Pages/CreatePostScreen/CreatePostScreen.dart';
import '../../../Pages/LandingScreen/LandingScreen.dart';
import '../../../Pages/ResponseScreen/ResponseScreen.dart';
import 'NavigationHelpers.dart';

// Declare the Routes as Enum
enum Routes { CreatePostScreen, LandingScreen, ResponseScreen }

// Create a class named Pages
class Pages {
  Object? data;
  // Create an instance for the class Pageconfig named as HomeScreenConfig
  static final PageConfig LandingScreenConfig = PageConfig(
      route: Routes.LandingScreen, build: (_) => const LandingScreen());

  // Create an instance for the class Pageconfig named as CalculationScreenConfig
  static final PageConfig CreatePostScreenConfig = PageConfig(
    route: Routes.CreatePostScreen,
    build: (_) =>
        CreatePostScreen(data: CreatePostScreenConfig.data, Data: null),
  );

  static final PageConfig ResponseScreenconfig = PageConfig(
      route: Routes.ResponseScreen,
      build: (_) =>
          ResponseScreen(data: ResponseScreenconfig.data, Data: null));
}
