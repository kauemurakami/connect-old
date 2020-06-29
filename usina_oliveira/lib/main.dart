import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:usina_oliveira/app/routes/app_routes.dart';
import 'package:usina_oliveira/app/ui/android/splash/splash_page.dart';
import 'package:usina_oliveira/app/ui/theme/app_theme.dart';

void main() {
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        theme: appTheme,
        defaultTransition: Transition.fade,
        getPages: MyRoutes.routes,
        home: SplashPage(),
    )
  );
}