import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Screens/Products/Widgets/product_design_widget.dart';
import 'package:medicinestore/Screens/Home/Widgets/view_all_widget.dart';
import 'package:sizer/sizer.dart';

class ListOfProductWidget extends StatelessWidget {
  const ListOfProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewAllWidget(
          onPressed: () {},
          title: "New medicines".tr(context),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of items per row
            childAspectRatio: 0.58, // Aspect ratio for grid items
            crossAxisSpacing: 5, // Spacing between items horizontally
            mainAxisSpacing: 10, // Spacing between items vertically
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ProductDesignWidget();
          },
        ),
      ],
    );
  }
}
