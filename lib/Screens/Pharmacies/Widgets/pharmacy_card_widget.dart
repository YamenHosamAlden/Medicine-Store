import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class PharmacyCardWidget extends StatelessWidget {
  const PharmacyCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w)),
          onPressed: () {},
          child: Column(
            children: [
              SizedBox(
                height: 1.h,
              ),
              CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: Shimmer.fromColors(
                    baseColor: AppColors.greyColor.withOpacity(0.5),
                    highlightColor: AppColors.greyColor,
                    child: Container(
                      height: 20.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) => InkWell(
                  onTap: () {
                    // GeneralRoute.navigatorPushWithContext(
                    //        type: PageTransitionType.fade,
                    //   context,
                    //   ViewImagesWidget(
                    //     image: championship.image,
                    //   ),
                    // );
                  },
                  child: Container(
                    height: 20.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.w),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                fadeInDuration: const Duration(milliseconds: 4),
                fadeOutDuration: const Duration(milliseconds: 4),
                imageUrl: "",
                errorWidget: (context, url, error) => Container(
                  height: 20.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.w),
                  ),
                  child: Image(
                    height: 10.h,
                    width: 20.w,
                    image: const AssetImage(AppAssets.bottleIcon),
                    color: AppColors.whiteColor,
                  ),
                ),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomText(
                            textData: "Pharmacy name",
                            textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Row(
                          children: [
                            Image(
                                height: 2.5.h,
                                width: 5.w,
                                color: AppColors.primaryColor,
                                image: const AssetImage(AppAssets.bottleIcon)),
                            SizedBox(
                              width: 2.w,
                            ),
                            CustomText(
                              textData: "15",
                              textStyle: TextStyle(
                                fontSize: 10.sp,
                                color: AppColors.borderColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CustomText(
                          textData: "Dr name :",
                          textStyle: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: CustomText(
                            textAlign: TextAlign.start,
                            textData: "Hamza",
                            textStyle: TextStyle(
                              fontSize: 10.sp,
                              color: AppColors.borderColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
