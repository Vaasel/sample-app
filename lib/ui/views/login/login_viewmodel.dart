import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parim_app/app/app.router.dart';
import 'package:parim_app/ui/common/api_client.dart';
import 'package:parim_app/ui/common/ui_helpers.dart';
import 'package:parim_app/ui/views/login/login_view.form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../common/url_container.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

void checkForm(BuildContext context) {
  // check if mail is empty
  if (emailValue == null || emailValue!.isEmpty) {
    showSnackBar(context, "Email is required");
  }
  else if(!emailValue!.contains('@')){
    showSnackBar(context, "Email is invalid");
  }
  else {
    getCompanyName(context);
  }
}

Future getCompanyName(BuildContext context) async{
  ApiClient apiClient = ApiClient.getInstance();

  var endpoint = UrlContainer.companyName;
  var data = {
    'email': emailValue,
  };

  var response = await apiClient.post(endpoint, data);

  if (response.statusCode == 200) {

    var res = jsonDecode(response.body);

    if(res['success'] == true){
      var companyName = res['message']['companyName'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('companyName', companyName);
      await prefs.setString('email', emailValue!);

      _navigationService.navigateTo(Routes.selectCompanyView);
    }else{
      var errorMessage = res['message'];
      showSnackBar(context, errorMessage);
    }

  } else {
    showSnackBar(context, "Failed to load data");
  }
}

}
