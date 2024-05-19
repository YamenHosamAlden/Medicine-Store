import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Util/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

class MedicineCardInfoWidget extends StatelessWidget {
  const MedicineCardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomText(
                      textData: "Additional information".tr(context),
                      textStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const Divider(
                color: AppColors.primaryColor,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: Column(
                  children: [
                          Row(
                      children: [
                        CustomText(
                          textData: "Names of pharmacies : ".tr(context),
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: CustomText(
                            textData: "hamza",
                            textStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.blackColor,
                            ),
                            textDirection: TextDirection.ltr,
                            textAlign: AppSharedPreferences.hasArLang
                                ? TextAlign.end
                                : TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          textData: "phone : ".tr(context),
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: CustomText(
                            textData: "0987654321",
                            textStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.blackColor,
                            ),
                            textDirection: TextDirection.ltr,
                            textAlign: AppSharedPreferences.hasArLang
                                ? TextAlign.end
                                : TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          textData: "Email : ".tr(context),
                          textStyle: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: CustomText(
                            textData: "hamza@gmail.com",
                            textStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.blackColor,
                            ),
                            textDirection: TextDirection.ltr,
                            textAlign: AppSharedPreferences.hasArLang
                                ? TextAlign.end
                                : TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
