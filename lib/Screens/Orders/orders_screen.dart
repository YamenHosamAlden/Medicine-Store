import 'package:flutter/material.dart';
import 'package:medicinestore/App/app_localizations.dart';
import 'package:medicinestore/Core/Constants/app_colors.dart';
import 'package:medicinestore/Screens/Main/Widgets/app_bar_widget.dart';
import 'package:medicinestore/Screens/Orders/Widgets/list_of_orders_widget.dart';
import 'package:sizer/sizer.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context, title: "My Orders".tr(context)),
      body: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColors.primaryColor,
                labelColor: AppColors.primaryColor,
                dividerColor: Colors.transparent,
                tabAlignment: TabAlignment.start,
                labelStyle:
                    TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
                isScrollable: true,
                tabs: [
                  Tab(
                    text: "All".tr(context),
                  ),
                  Tab(text: "Accepted Orders".tr(context)),
                  Tab(text: "Pending Orders".tr(context)),
                  Tab(text: "Delivering Orders".tr(context)),
                  Tab(text: "Rejected Orders".tr(context)),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                  const   ListOfOrdersWidget(),
                    Container(),
                    Container(),
                    Container(),
                    Container()
                  ],
                ),
              )
            ],
          )),
    );
  }
}
