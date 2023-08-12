import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class PasswordViewModel extends FormViewModel {
  bool isPasswordVisible = false;
  final _navigationService = locator<NavigationService>();

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool get passwordVisibilty => isPasswordVisible;

  nextScreen() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
