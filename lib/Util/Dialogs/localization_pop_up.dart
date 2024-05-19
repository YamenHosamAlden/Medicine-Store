import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Bloc/app_language_bloc/app_language_bloc.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Util/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:medicinestore/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

popUpChooseLocale(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        bool value = AppSharedPreferences.hasArLang;
        return AlertDialog(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.w)),
            content: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: CustomText(
                        textData: "Choose your language".tr(context),
                        textStyle: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold))),
                const SizedBox(height: 5),
                CheckboxListTile(
                    value: !value,
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primaryColor;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return AppColors.whiteColor;
                      }
                      return AppColors.whiteColor;
                    }),
                    checkColor: AppColors.whiteColor,
                    onChanged: (newVal) {
                      newVal = AppSharedPreferences.hasArLang;
                      BlocProvider.of<AppLanguageBloc>(context)
                          .add(ChangeLanguageToEn());
                    },
                    title: const CustomText(textData: 'English')),
                CheckboxListTile(
                    value: value,
                    fillColor: MaterialStateProperty.resolveWith((states) {
                      // If the button is pressed, return green, otherwise blue
                      if (states.contains(MaterialState.selected)) {
                        return AppColors.primaryColor;
                      }
                      if (states.contains(MaterialState.hovered)) {
                        return AppColors.whiteColor;
                      }
                      return AppColors.whiteColor;
                    }),
                    checkColor: AppColors.whiteColor,
                    onChanged: (newVal) {
                      newVal = !AppSharedPreferences.hasArLang;
                      BlocProvider.of<AppLanguageBloc>(context)
                          .add(ChangeLanguageToAr());
                    },
                    title: const CustomText(
                      textData: 'العربية',
                    )),
              ]),
            ));
      });
}
