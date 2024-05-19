import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Cart/Widgets/product_shop_widget.dart';
import 'package:medicinestore/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(

       
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              textAlign: TextAlign.center,
              textData: "Send Order".tr(context),
              textStyle:  TextStyle(
                fontSize: 10.sp,
                  color: AppColors.whiteColor, fontWeight: FontWeight.bold),
            ),
             Icon(Icons.send,color: AppColors.whiteColor,size: 5.w,)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ProductShopWidget();
        },
      ),
    );
  }
}
