import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/app_strings.dart';
import 'login_viewmodel.dart';
import 'login_view.form.dart';
import '../../common/app_colors.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: kcPrimaryColor,
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
          Expanded(
            child: SingleChildScrollView(
              // Wrap the content with SingleChildScrollView
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      kEmail,
                      style: TextStyle(
                          color: kcBlackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: kEmailExample),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    viewModel.checkForm(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
                    minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50),
                    ),
                  ),
                  child: const Text(kContinue),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
