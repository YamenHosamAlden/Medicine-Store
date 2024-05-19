import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class TextInfoWidget extends StatelessWidget {
 final String text;
 final String info;
 const  TextInfoWidget({required this.text, required this.info, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    
        CustomText(
       textData:    "$info : ",
          textStyle: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        ),
            CustomText(
              textAlign: TextAlign.start,
                   textData:    text,
                      textStyle: TextStyle(fontSize: 12.sp),
                    ),
      ],
    );
  }
}
