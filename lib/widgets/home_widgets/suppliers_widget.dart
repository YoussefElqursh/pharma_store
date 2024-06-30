import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/components/functions.dart';
import 'package:pharma_store/shared/styles/colors.dart';

class SupplierHome extends StatelessWidget {
  // List of names/icons to display
  final List<Map<String, dynamic>> items = [
    {
      'icon': setPhoto(kind: 1, width: 15, height: 13, path: "assets/icons/home.svg"),
      'name': 'A1-Dawlia Medical N-Pharma'
    },
    {
      'icon': setPhoto(kind: 1, width: 15, height: 13, path: "assets/icons/home.svg"),
      'name': 'A1-Dawlia Medical N-Pharma'
    },
    {
      'icon': setPhoto(kind: 1, width: 15, height: 13, path: "assets/icons/home.svg"),
      'name': 'A1-Dawlia Medical N-Pharma'
    },
    {
      'icon': setPhoto(kind: 1, width: 15, height: 13, path: "assets/icons/home.svg"),
      'name': 'A1-Dawlia Medical N-Pharma'
    },
    {
      'icon': setPhoto(kind: 1, width: 15, height: 13, path: "assets/icons/home.svg"),
      'name': 'A1-Dawlia Medical N-Pharma'
    },
    {
      'icon': setPhoto(kind: 1, width: 15, height: 13, path: "assets/icons/home.svg"),
      'name': 'A1-Dawlia Medical N-Pharma'
    },
    // Add more items as needed
  ];

  SupplierHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the text to start
      children: [
        Row(
          children: [
            const Text(
              "Suppliers",
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
                "See All (16)",
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
        const SizedBox(height: 17),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items.map((item) {
              return Container(
                height: 48,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: HexColor(placeholder)),
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: const EdgeInsets.only(right: 8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    children: [
                      item['icon'], // Use the icon directly
                      const SizedBox(width: 5),
                      Text(item['name']
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
