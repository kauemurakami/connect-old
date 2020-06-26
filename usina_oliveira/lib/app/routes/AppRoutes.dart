import 'package:get/get.dart';
import 'package:usina_oliveira/app/ui/android/splash/splash_page.dart';

class MyRoutes {

  static final routes = [
    GetPage(name: '/', page:()=> SplashPage(),)
    GetPage(name: '/login', page:()=> LoginPage()),
    GetPage(name: '/prestador-home', page:()=> PestadorHomePage()),
    GetPage(name: '/empresa-home', page:()=> EmpresaHomePage()),
  ];
}