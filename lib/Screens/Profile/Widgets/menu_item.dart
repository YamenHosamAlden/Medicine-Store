import 'dart:core';

import 'package:flutter/material.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Widgets/custom_text.dart';

import 'package:sizer/sizer.dart';

class MenuItemm extends StatefulWidget {
  final String title;
  final String image;

  final Function() tap;

  const MenuItemm({
    super.key,
    required this.title,
    required this.tap,
    required this.image,
  });

  @override
  State<MenuItemm> createState() => _MenuItemmState();
}

class _MenuItemmState extends State<MenuItemm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: MaterialButton(
        onPressed: widget.tap,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
            decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(bottom: BorderSide(color: AppColors.greyColor))),
            child: Column(children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            widget.image,
                            height: 3.h,
                            width: 6.w,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          CustomText(
                            textData: widget.title,
                            textStyle: TextStyle(
                                fontSize: 13.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  )),
            ])),
      ),
    );
  }
}
