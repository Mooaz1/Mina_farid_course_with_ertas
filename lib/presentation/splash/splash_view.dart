import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mf_course/presentation/resources/assest_manger.dart';
import 'package:mf_course/presentation/resources/color_manger.dart';
import 'package:mf_course/presentation/resources/constant_manger.dart';
import 'package:mf_course/presentation/resources/route_manger.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer timer;
  changePage() {
    timer = Timer(const Duration(seconds: ConstantManger.timerSplash ),
        () => Navigator.pushReplacementNamed(context, RouteName.onbordingView));
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManger.primary,
      child: Center(
        child: Image.asset(AssetManager.splashImage),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
