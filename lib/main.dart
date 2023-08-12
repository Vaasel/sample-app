import 'package:flutter/material.dart';
import 'package:parim_app/app/app.bottomsheets.dart';
import 'package:parim_app/app/app.dialogs.dart';
import 'package:parim_app/app/app.locator.dart';
import 'package:parim_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.loginView,
      theme: ThemeData(fontFamily: 'Poppins'),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
