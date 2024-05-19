
import 'package:flutter/material.dart';
import 'package:medicinestore/Screens/Home/Widgets/carousel_slider_images.dart';
import 'package:medicinestore/Screens/Home/Widgets/list_of_product_widget.dart';
import 'package:medicinestore/Widgets/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor:   Theme.of(context).colorScheme.background,
      body:
        Column(
          children: [
        const    SearchWidget(),
            Expanded(
              child: ListView(
                children: const [
                  
                  CarouselSliderImages(images: []),
                  ListOfProductWidget()
              
                ],
              ),
            ),
          ],
        ),
      
    );
  }
}
