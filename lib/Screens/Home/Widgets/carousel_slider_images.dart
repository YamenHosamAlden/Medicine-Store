import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_assets.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';

import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSliderImages extends StatefulWidget {
  final List<String> images;

  const CarouselSliderImages({required this.images, super.key});

  @override
  State<CarouselSliderImages> createState() => _CarouselSliderImagesState();
}

class _CarouselSliderImagesState extends State<CarouselSliderImages> {
  int activeIndex = 0;

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return widget.images.isEmpty
        ? Padding(
          padding:  EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) {
                    return InkWell(
                        onTap: () {
                     
                        },
                        child:Container(
          margin: EdgeInsets.symmetric(horizontal: 2.w),
          // height: hightImage.h,
          // width: widthImage.w,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: AppColors.borderColor),
              borderRadius: BorderRadius.circular(5.w),
              image:const  DecorationImage(
                  image: AssetImage(AppAssets.product1Image), fit: BoxFit.contain)),
                      ),);
                  },
                  options: CarouselOptions(
                    // scrollPhysics: const NeverScrollableScrollPhysics(),
                    enableInfiniteScroll: false,
                    height: 25.h,
                    enlargeCenterPage: true,
                    autoPlay: false,
          
                    viewportFraction: 1,
          
                    onPageChanged: (index, reason) {
                      return setState(() => activeIndex = index);
                    },
                  )),
              SizedBox(
                height: 1.h,
              ),
              // widget.images.length != 1
                  // ? 
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSmoothIndicator(
                            activeIndex: activeIndex,
                            count: 3,
                            effect: const WormEffect(
                                dotHeight: 15,
                                dotWidth: 15,
                                dotColor: AppColors.borderColor,
                                activeDotColor: AppColors.primaryColor))
                      ],
                    )
                  // : const SizedBox()
            ],
          ),
        )
        : const SizedBox();
  }
}
