import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:sizer/sizer.dart';

BottomNavigationBarItem bottomNavigationBarItem(BuildContext context,
    {required int currentIndex,
    required int index,
    required String icon,
    required String label}) {
  return BottomNavigationBarItem(
    
    icon: Column(
      children: [
        ImageIcon(
          AssetImage(icon),
          size: 8.w,
        ),
        currentIndex == index
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Container(
                      height: 1.h,
                      width: 2.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const Expanded(
                        child: Divider(
                      color: AppColors.whiteColor,
                      thickness: 1,
                    )),
                    Container(
                      height: 1.h,
                      width: 2.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox()
      ],
    ),
    label: label,
  );
}
