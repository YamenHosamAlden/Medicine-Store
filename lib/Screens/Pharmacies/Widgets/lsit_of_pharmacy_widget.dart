import 'package:flutter/material.dart';
import 'package:medicinestore/Screens/Pharmacies/Widgets/pharmacy_card_widget.dart';

class ListOfPharmacyWidget extends StatelessWidget {
  const ListOfPharmacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return PharmacyCardWidget();
      },
    );
  }
}
