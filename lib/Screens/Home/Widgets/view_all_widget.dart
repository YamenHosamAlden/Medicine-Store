import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class ViewAllWidget extends StatelessWidget {
  final String title;
  final Function onPressed;
  const ViewAllWidget(
      {required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Row(
        children: [
          Expanded(
              child: Text(
            title,
            style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold),
          )),
          TextButton(
              onPressed: () {
                onPressed();
              },
              child: Row(
                children: [
                  Text(
                    "View all".tr(context),
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColors.primaryColor,
                    size: 6.w,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
