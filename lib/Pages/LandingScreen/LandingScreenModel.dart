import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:social_media/Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';

import '../../BOs/PostBO/PostBO.dart';
import '../../Helpers/Mixins/TextFieldMixin.dart';
import '../../Helpers/Mixins/ToastMixin.dart';
import '../../Services/PlatformServices/PlatformSharedPreferenceService/IPlatformSharedPreferenceService.dart';
part 'LandingScreenModel.g.dart';

class LandingScreenModel extends LandingScreenModelBase
    with _$LandingScreenModel,NavigationMixin, TextFieldMixin, ToastMixin {}

abstract class LandingScreenModelBase with Store {

  // Get the service
  IPlatformSharedPreferenceService platformSharedPreferenceService =
      GetIt.instance.get<IPlatformSharedPreferenceService>();

  // Define an observable variable to hold the userdetails.
  // Set the name as "" and age as 0 initially.
  @observable
  PostBO userdetails = PostBO(description: '', title: '', id: null, date: DateTime.now());

  /* Define an action method to update the userdetails */
  @action
  setUserDetails({required PostBO userdetails}) {
    this.userdetails = userdetails;
  }

  // Define an observable variable to hold "name".
  // Set the name as "" intially
  @observable
  String title = '';

  /* Create an action method to update name */
  @action
  setUserName({required String title}) {
    this.title = title;
  }

  // Define an observable variable to hold "age".
  @observable
  String? description;

  /* Define an action method to update the age */
  setUserAge({required String description}) {
    this.description = description;
  }
}