import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ListOfShimmerWidget extends StatelessWidget {
  final double height;
  final double width;
  final int itemCount;
  const ListOfShimmerWidget({
    super.key,
    required this.height,
    this.itemCount = 10,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        child: Shimmer.fromColors(
          baseColor: AppColors.greyColor.withOpacity(0.5),
          highlightColor: AppColors.greyColor,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(5.w)),
          ),
        ),
      ),
    );
  }
}
