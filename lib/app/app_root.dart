import 'package:flutter/material.dart';
import 'package:mf_course/presentation/resources/route_manger.dart';
import 'package:mf_course/presentation/resources/theme_manger.dart';

class AppRoot extends StatelessWidget {
   const AppRoot._internal();
  static  const  _instance=  AppRoot._internal();
  factory AppRoot()=>_instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManger.getLightTheme(),
      onGenerateRoute: RouteManger.route,
      initialRoute: RouteName.splashView,
    );
  }
}
