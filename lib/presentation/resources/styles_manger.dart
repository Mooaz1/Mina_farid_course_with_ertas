import 'package:flutter/material.dart';
import 'package:mf_course/presentation/resources/font_manger.dart';

class StylesManger {
  static TextStyle lightMontserratStyle({
    required Color color,
    double fontSize = FontSizeManger.s12,
  }) =>
      TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeightManger.light);

  static TextStyle regularMontserratStyle({
    required Color color,
    double fontSize = FontSizeManger.s12,
  }) =>
      TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeightManger.regular);

  static TextStyle mediumMontserratStyle({
    required Color color,
    double fontSize = FontSizeManger.s12,
  }) =>
      TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeightManger.medium);

  static TextStyle semiBoldMontserratStyle({
    required Color color,
    double fontSize = FontSizeManger.s12,
  }) =>
      TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeightManger.semiBold);

  static TextStyle boldMontserratStyle({
    required Color color,
    double fontSize = FontSizeManger.s12,
  }) =>
      TextStyle(
          fontFamily: FontConstants.fontFamily,
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeightManger.bold);
}
