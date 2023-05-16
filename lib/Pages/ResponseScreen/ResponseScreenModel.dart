
import 'package:mobx/mobx.dart';

import '../../Helpers/AppNavigations/AppNavigations/NavigationMixin.dart';

part 'ResponseScreenModel.g.dart';

// ignore: library_private_types_in_public_api
// Create a model class named CalculationScreenModel
class ResponseScreenModel = _ResponseScreenModelBase
    with _$ResponseScreenModel, NavigationMixin;

abstract class _ResponseScreenModelBase with Store {
  // Create an observable variable
}
