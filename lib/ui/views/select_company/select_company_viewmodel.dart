import 'package:parim_app/app/app.router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class SelectCompanyViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  Future<String> getCompanyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String companyName = prefs.getString('companyName') ?? "";
    return companyName;
  }

  companySelected() {
    print("Company Selected");
    _navigationService.navigateTo(Routes.passwordView);
  }
}
