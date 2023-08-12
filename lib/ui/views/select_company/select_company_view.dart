import 'package:flutter/material.dart';
import 'package:parim_app/ui/common/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import 'select_company_viewmodel.dart';

class SelectCompanyView extends StackedView<SelectCompanyViewModel> {

  @override
  Widget builder(
    BuildContext context,
    SelectCompanyViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: kcPrimaryColor,
                height: 200,
                width: double.infinity,
                child: const Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.person,
                      size: 80,
                      color: kcWhiteColor,
                    ),
                    Text(
                      kABC,
                      style: TextStyle(color: kcWhiteColor, fontSize: 40),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(20),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      kSelectCompany,
                      style: TextStyle(
                          color: kcBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: kcLightGrey,
              ),
              FutureBuilder<String>(
                  future: viewModel.getCompanyName(),
                  builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loader while waiting
                  return CircularProgressIndicator(
                  backgroundColor: kcPrimaryColor,
                  ); // Replace this with your loader widget
                  } else if (snapshot.hasError) {
                  // Handle error case
                  return Text('Error: ${snapshot.error}');
                  } else {
                  // Display company details once retrieved
                  String companyName = snapshot.data ?? '';
                return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(companyName),
                    subtitle: Text(companyName+".wixindex.com"),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      viewModel.companySelected();
                    },
                  );
                },
              );
            }},),
              const Divider(
                height: 1,
                color: kcLightGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SelectCompanyViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SelectCompanyViewModel();
}
