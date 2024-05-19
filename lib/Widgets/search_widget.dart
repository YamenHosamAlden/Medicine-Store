
import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Widgets/custom_text_falid.dart';
import 'package:sizer/sizer.dart';

class SearchWidget extends StatelessWidget {

  const SearchWidget({ super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 2.h),
      child: CustomTextField(
          controller: TextEditingController(),
          fillColor: AppColors.textFieldColor,
          hintText: "Search".tr(context),
          prefixIcon: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Image(
              image: const AssetImage(AppAssets.searchIcon),
              color: AppColors.primaryColor,
              width: 5.w,
              height: 2.h,
              fit: BoxFit.fill,
            ),
          ),
          textInputType: TextInputType.text),
    );
  }
}
