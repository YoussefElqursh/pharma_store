import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/styles/colors.dart';

import 'medicine_card_widget.dart';

class HomeHotDeal extends StatelessWidget {
  // List of names/icons to display

  const HomeHotDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the text to start
      children: [
        Row(
          children: [
            const Text(
              "Hot Deal",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                height: 21 / 14, // Calculate the height as needed
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // Handle the "See All" button press
              },
              child: Text(
                "See All (30)",
                style: TextStyle(
                  color: HexColor(primaryColor),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 18 / 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        MedicineCard()

      ],
    );
  }
}
