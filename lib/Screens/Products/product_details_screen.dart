import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Home/Widgets/carousel_slider_images.dart';
import 'package:medicinestore/Screens/Main/Widgets/app_bar_widget.dart';
import 'package:medicinestore/Widgets/custom_button.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  // List<String> convertToListOfString(List<Images> imageFormApi) {
  //   List<String> images = [];
  //   print("here");
  //   for (var element in imageFormApi) {
  //     images.add(Urls.storage + element.image!);
  //     print("here $images");
  //   }
  //   return images;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context, title: "Medicine Details".tr(context)),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  const CarouselSliderImages(images: []),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "Medicine Name",
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                          "description description description description description description description description description description description description description",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 15.sp,
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            textData: "Quantity Available : ".tr(context),
                            textStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          CustomText(
                                                      textAlign: TextAlign.start,
                                                      textData: "14",
                                                      textStyle: TextStyle(
                            fontSize: 12.sp, color: AppColors.blackColor),
                                                    )
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            textData: "Price : ".tr(context),
                            textStyle: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primaryColor),
                          ),
                          CustomText(
                                                      textAlign: TextAlign.start,
                                                      textData: "600",
                                                      textStyle: TextStyle(
                            fontSize: 12.sp, color: AppColors.blackColor),
                                                    )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                        onPressed: () {},
                        buttonText: "Add to Cart".tr(context)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
