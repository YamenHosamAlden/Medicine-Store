import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Widgets/custom_button.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

Future showConfirmDialog(BuildContext context,
    {required String title, required Function onPressed}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            scrollable: true,
            title: CustomText(
              textData: title,
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold),
            ),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              CustomButton(
                onPressed: () {
                  GeneralRoute.navigatorPobWithContext(context);
                  onPressed();
                },
                buttonText: "Yes".tr(context),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomButton(
                onPressed: () {
                  GeneralRoute.navigatorPobWithContext(context);
                },
                buttonText: "No".tr(context),
              ),
            ],
          ));
}
