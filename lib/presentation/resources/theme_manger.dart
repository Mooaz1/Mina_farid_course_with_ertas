import 'package:flutter/material.dart';
import 'package:mf_course/presentation/resources/color_manger.dart';
import 'package:mf_course/presentation/resources/font_manger.dart';
import 'package:mf_course/presentation/resources/styles_manger.dart';
import 'package:mf_course/presentation/resources/values_manger.dart';

class ThemeManger {
  static ThemeData getLightTheme() => ThemeData(
        primaryColor: ColorManger.primary,
        primaryColorLight: ColorManger.lightPrimary,
        primaryColorDark: ColorManger.darkPrimary,
        splashColor: ColorManger.lightPrimary,
        disabledColor: ColorManger.disabledColor,
        cardTheme: CardTheme(
          color: ColorManger.white,
          elevation: 4,
          shadowColor: ColorManger.grey,
        ),
        appBarTheme: AppBarTheme(
            elevation: 0,
            centerTitle: true,
            color: ColorManger.primary,
            titleTextStyle: StylesManger.regularMontserratStyle(
                color: ColorManger.white, fontSize: FontSizeManger.s16)),
        buttonTheme: ButtonThemeData(
          buttonColor: ColorManger.primary,
          splashColor: ColorManger.lightPrimary,
          disabledColor: ColorManger.disabledColor,
          shape: const StadiumBorder(),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          textStyle: StylesManger.regularMontserratStyle(
              color: ColorManger.white, fontSize: FontSizeManger.s16),
          backgroundColor: ColorManger.primary,
          disabledBackgroundColor: ColorManger.disabledColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        )),
        textTheme: TextTheme(
            displayLarge: StylesManger.semiBoldMontserratStyle(
                color: ColorManger.darkGrey, fontSize: FontSizeManger.s16),
            headlineLarge: StylesManger.semiBoldMontserratStyle(
                color: ColorManger.darkGrey, fontSize: FontSizeManger.s16),
            headlineMedium: StylesManger.regularMontserratStyle(
                color: ColorManger.darkGrey, fontSize: FontSizeManger.s14),
            titleMedium: StylesManger.mediumMontserratStyle(
                color: ColorManger.primary, fontSize: FontSizeManger.s16),
            titleSmall: StylesManger.regularMontserratStyle(
                color: ColorManger.white, fontSize: FontSizeManger.s16),
            bodyLarge: StylesManger.regularMontserratStyle(
                color: ColorManger.disabledColor),
            bodySmall:
                StylesManger.regularMontserratStyle(color: ColorManger.grey),
            bodyMedium: StylesManger.regularMontserratStyle(
                color: ColorManger.grey2, fontSize: FontSizeManger.s12),
            labelSmall: StylesManger.boldMontserratStyle(
                color: ColorManger.primary, fontSize: FontSizeManger.s12)),
        inputDecorationTheme: InputDecorationTheme(
            // content padding
            contentPadding: const EdgeInsets.all(PaddingManger.p8),
            // hint style
            hintStyle: StylesManger.regularMontserratStyle(
                color: ColorManger.grey, fontSize: FontSizeManger.s14),
            labelStyle: StylesManger.mediumMontserratStyle(
                color: ColorManger.grey, fontSize: FontSizeManger.s14),
            errorStyle:
                StylesManger.regularMontserratStyle(color: ColorManger.error),

            // enabled border style
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManger.grey, width: SizeManger.s1_5),
                borderRadius:
                    const BorderRadius.all(Radius.circular(SizeManger.s12))),

            // focused border style
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManger.primary, width: SizeManger.s1_5),
                borderRadius:
                    const BorderRadius.all(Radius.circular(SizeManger.s12))),

            // error border style
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManger.error, width: SizeManger.s1_5),
                borderRadius:
                    const BorderRadius.all(Radius.circular(SizeManger.s12))),
            // focused border style
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: ColorManger.primary, width: SizeManger.s1_5),
                borderRadius:
                    const BorderRadius.all(Radius.circular(SizeManger.s12)))),
      );
}
