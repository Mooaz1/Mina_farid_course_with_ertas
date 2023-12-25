import 'package:flutter/material.dart';
import 'package:mf_course/presentation/login/login_view.dart';
import 'package:mf_course/presentation/onbording/onbording_view.dart';
import 'package:mf_course/presentation/resources/color_manger.dart';
import 'package:mf_course/presentation/resources/font_manger.dart';
import 'package:mf_course/presentation/resources/strings_manager.dart';
import 'package:mf_course/presentation/resources/styles_manger.dart';
import 'package:mf_course/presentation/splash/splash_view.dart';

class RouteName {
  static const splashView = '/';
  static const onbordingView = 'onbording/';
  static const loginView = 'login/';
}

class RouteManger {
  static Route route(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashView:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RouteName.onbordingView:
        return MaterialPageRoute(builder: (_) => const OnbordingView());
        case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        return MaterialPageRoute(
            builder: (_) => Material(
                  color: ColorManger.white,
                  child: Center(
                    child: Text(
                      StringsManager.noRootFound,
                      style: StylesManger.boldMontserratStyle(
                          color: ColorManger.black,
                          fontSize: FontSizeManger.s20),
                    ),
                  ),
                ));
    }
  }
}
