import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

class ProductShopWidget extends StatelessWidget {



const   ProductShopWidget(
      {
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
     
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
            textData:     "name",
                textStyle:
                    TextStyle(color: AppColors.primaryColor, fontSize: 16.sp),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomText(textData:  "500", textStyle: TextStyle(fontSize: 14.sp)),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                      color: AppColors.whiteColor,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.add,
                        size: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  CustomText(textData:  "5",
                      textStyle: TextStyle(
                          color: AppColors.primaryColor, fontSize: 16.sp)),
                  SizedBox(
                    width: 2.w,
                  ),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
                     color: AppColors.whiteColor,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.remove,
                        size: 16.sp,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              
            ],
          )),
          Image(
          height: 20.h,
          width: 40.w,
          image:const  AssetImage(
            AppAssets.logoImage,
          ),
          color: AppColors.primaryColor,
                    ),
        ],
      ),
    );
  }
}
