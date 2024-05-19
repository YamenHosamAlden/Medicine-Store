import 'package:flutter/material.dart';
import 'package:medicinestore/Screens/Orders/Widgets/order_design_widget.dart';

class ListOfOrdersWidget extends StatelessWidget {
  const ListOfOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return OrderDesignWidget(orderState: "");
              });
  }
}