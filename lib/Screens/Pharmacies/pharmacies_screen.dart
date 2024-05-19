import 'package:flutter/material.dart';

import 'package:medicinestore/Screens/Pharmacies/Widgets/lsit_of_pharmacy_widget.dart';
import 'package:medicinestore/Widgets/search_widget.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      //  backgroundColor:   Theme.of(context).colorScheme.background,
    
      body:  Column(
        children: [
           SearchWidget(),
          Expanded(
            child: ListOfPharmacyWidget()
          ),
        ],
      ),
    );
  }
}
