import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

PreferredSizeWidget appBarWidget(BuildContext context,
    {required String title, bool buttonBack = true}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    child: AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: buttonBack
          ? InkWell(
              onTap: () {
                GeneralRoute.navigatorPobWithContext(context);
              },
              child: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.whiteColor,
                size: 8.w,
              ))
          : null,
      title: CustomText(
        textData: title,
        textStyle: const TextStyle(color: AppColors.whiteColor),

        // textColor: AppColors.primaryColor,
      ),
      actions:!buttonBack? [
        IconButton(
          onPressed: () {},
          icon: ImageIcon(
            const AssetImage(AppAssets.notification2Icon),
            size: 8.w,
            color: AppColors.whiteColor,
          ),
        )
      ]:null,
    ),
  );
}
