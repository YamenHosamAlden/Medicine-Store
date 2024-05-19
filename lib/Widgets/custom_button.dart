import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final FontWeight? fontWeight;
  final double? size;
  final Color? buttonColor;

  const CustomButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonColor=AppColors.primaryColor,
      this.fontWeight = FontWeight.bold,
      this.size = 16,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          color: buttonColor),
      child: MaterialButton(
        //height: 6.h,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.w)),
        // color: buttonColor,
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: size!.sp,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
