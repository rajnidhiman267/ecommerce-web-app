import 'package:ecommerce_admin_panel/features/authentication/screens/forget_password/forget_password.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/login/login.dart';
import 'package:ecommerce_admin_panel/features/authentication/screens/reset_password/reset_password.dart';
import 'package:ecommerce_admin_panel/features/dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce_admin_panel/routes/routes.dart';
import 'package:ecommerce_admin_panel/routes/routes_middleware.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class TAppRoute {
  static final List<GetPage> pages = [
    GetPage(name: TRoute.login, page: () => LoginScreen()),
    GetPage(name: TRoute.forgetPassword, page: () => ForgetPasswordScreen()),
    GetPage(name: TRoute.resetPassword, page: () => ResetPasswordScreen()),
    GetPage(
      name: TRoute.dashBoard,
      page: () => DashboardScreen(),
      middlewares: [TRouteMiddleware()],
    ),
  ];
}
