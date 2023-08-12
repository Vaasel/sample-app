import 'package:flutter/material.dart';
import 'package:parim_app/ui/common/app_strings.dart';
import 'package:parim_app/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../common/app_colors.dart';
import 'password_viewmodel.dart';

import 'password_view.form.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class PasswordView extends StackedView<PasswordViewModel> with $PasswordView {
  const PasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PasswordViewModel viewModel,
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
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: kPassword,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            viewModel.togglePasswordVisibility();
                          },
                          child: Icon(
                            viewModel.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kcLightGrey,
                          ),
                        ),
                      ),
                      obscureText: viewModel.isPasswordVisible,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Email: ${emailController.value.text}');
                  print('Password: ${passwordController.value.text}');
                  viewModel.nextScreen();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
                  fixedSize: MaterialStateProperty.all(
                    const Size(300, 50),
                  ),
                ),
                child: const Text(kContinue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(PasswordViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  PasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PasswordViewModel();
}
