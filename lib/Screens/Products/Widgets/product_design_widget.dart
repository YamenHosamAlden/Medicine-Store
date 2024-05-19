import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Products/product_details_screen.dart';
import 'package:medicinestore/Util/GeneralRoute.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

class ProductDesignWidget extends StatefulWidget {
  const ProductDesignWidget({super.key});

  @override
  State<ProductDesignWidget> createState() => _ProductDesignWidgetState();
}

class _ProductDesignWidgetState extends State<ProductDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.w,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(5.w),
          onTap: () {
            GeneralRoute.navigatorPushWithContext(
                context, ProductDetailsScreen());
          },
          child: Column(
            children: [
              // CachedNetworkImage(
              //     placeholder: (context, url) => Center(
              //           child: Shimmer.fromColors(
              //             baseColor: AppColors.borderColor,
              //             highlightColor: Colors.grey[100]!,
              //             child: Container(
              //               height: 18.h,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.only(
              //                     topRight: Radius.circular(4.w),
              //                     topLeft: Radius.circular(4.w)),
              //               ),
              //               width: double.infinity,
              //             ),
              //           ),
              //         ),
              //     imageBuilder: (context, imageProvider) => Container(
              //           height: 18.h,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.only(
              //                   topRight: Radius.circular(4.w),
              //                   topLeft: Radius.circular(4.w)),
              //               image: DecorationImage(
              //                   image: imageProvider, fit: BoxFit.cover)),
              //           width: double.infinity,
              //         ),
              //     fadeInDuration: const Duration(milliseconds: 4),
              //     fadeOutDuration: const Duration(milliseconds: 4),
              //     imageUrl: Urls.storage + widget.product.images![0].image!,
              //     errorWidget: (context, url, error) => Container(
              //         margin: EdgeInsets.symmetric(horizontal: 2.w),
              //         width: double.infinity,
              //         height: 20.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //               topRight: Radius.circular(4.w),
              //               topLeft: Radius.circular(4.w)),
              //         ),
              //         child: const Icon(Icons.error))),

              Container(
                height: 18.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4.w),
                        topLeft: Radius.circular(4.w)),
                    image: const DecorationImage(
                        image: AssetImage(AppAssets.product2Image),
                        fit: BoxFit.cover)),
                width: double.infinity,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            textData: "Name :".tr(context),
                            textAlign: TextAlign.start,
                          ),
                          const Expanded(
                              child: CustomText(
                            textData: "Product name",
                            textAlign: TextAlign.start,
                          )),
                        ],
                      ),
                      const Row(
                        children: [
                          Expanded(
                              child: CustomText(
                            textData: "Description",
                            textAlign: TextAlign.start,
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            textData: "Quantity Available :".tr(context),
                            textAlign: TextAlign.start,
                            textStyle: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: CustomText(
                            textData: "10",
                            textAlign: TextAlign.start,
                            textStyle: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold),
                          )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image(
                                  image: const AssetImage(AppAssets.cartIcon),
                                  height: 3.h,
                                  width: 6.w,
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
