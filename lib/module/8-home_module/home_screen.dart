import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/home_widgets/home_carousel.dart';
import '../../widgets/home_widgets/home_head_pharmacy_details.dart';
import '../../widgets/home_widgets/home_search.dart';
import '../../widgets/home_widgets/hot_deal_widget.dart';
import '../../widgets/home_widgets/most_selling_widget.dart';
import '../../widgets/home_widgets/suppliers_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 48.0, bottom: 20.0),
      child: Column(
        children: [
          const HeadPharmacyDetails(),
          const SizedBox(height: 24),
          const HomeSearch(),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const HomeCarousel(),
                  const SizedBox(height: 24),
                  SupplierHome(),
                  const SizedBox(height: 24),
                  HomeMostSelling(),
                  const SizedBox(height: 24),

                  const HomeHotDeal()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
