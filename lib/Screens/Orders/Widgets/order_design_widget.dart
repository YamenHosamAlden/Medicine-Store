import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Orders/Widgets/textInfo_widget.dart';
import 'package:sizer/sizer.dart';

class OrderDesignWidget extends StatelessWidget {
  final String orderState;
  const OrderDesignWidget({required this.orderState, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20.h,
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(3, 3)),
      ]),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  TextInfoWidget(
                      info: "Order State".tr(context), text: "Pending"),
                  TextInfoWidget(info: "Order Number".tr(context), text: "5"),
                  TextInfoWidget(info: "Order Price".tr(context), text: "6000"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      orderState == "Rejected"
                          ? Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ImageIcon(
                                      const AssetImage(AppAssets.removeIcon),
                                      color: AppColors.primaryColor,
                                      size: 6.w),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: ImageIcon(
                                      const AssetImage(AppAssets.editIcon),
                                      color: AppColors.primaryColor,
                                      size: 6.w),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                              ],
                            )
                          : Container(),
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          elevation: 3,
                          onPressed: () {},
                          color: AppColors.primaryColor,
                          child: Text(
                            "View Order".tr(context),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Image(
            height: 20.h,
            width: 40.w,
            image:const  AssetImage(
              AppAssets.logoImage,
            ),
            color: AppColors.primaryColor,
          )
        ],
      ),
    );
  }
}
