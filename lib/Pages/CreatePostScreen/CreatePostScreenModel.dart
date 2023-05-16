import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../BOs/PostBO/PostBO.dart';
import '../../Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';
import '../../Helpers/Mixins/TextFieldMixin.dart';
import '../../Helpers/Mixins/ToastMixin.dart';
import '../../Services/PlatformServices/PlatformSharedPreferenceService/IPlatformSharedPreferenceService.dart';
part 'CreatePostScreenModel.g.dart';

// ignore: library_private_types_in_public_api
// Create a model class named CalculationScreenModel

class CreatePostScreenModel extends CreatePostScreenModelBase
    with _$CreatePostScreenModel,NavigationMixin, TextFieldMixin, ToastMixin {}

abstract class CreatePostScreenModelBase with Store {

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
  settitle({required String title}) {
    this.title = title;
  }

  // Define an observable variable to hold "age".
  @observable
  String? description;

  /* Define an action method to update the age */
  setDescription({required String description}) {
    this.description = description;
  }
}