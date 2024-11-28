import 'package:get/get.dart';
import 'package:starter/app/modules/home/bindings/home_binding.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/modules/splash/bindings/splash_binding.dart';
import 'package:starter/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
