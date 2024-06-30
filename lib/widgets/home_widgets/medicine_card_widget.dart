import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/components/functions.dart';
import 'package:pharma_store/shared/styles/colors.dart';

class MedicineCard extends StatelessWidget {
  // List of names/icons to display
  final List<Map<String, dynamic>> items = [
    {
      'photo': setPhoto(
          kind: 0,  // Change this to 0 as the image is not SVG
          width: 142,  // Adjust width and height as per your need
          height: 105,
          path: "assets/images/medicine_image.jpg"),
      'storeName': 'A1-Dawlia Medical N-Pharma',
      'offer': 15,
      'medicineName': 'Panadol COLD & FLU DAY',
      'beforeDiscount': 45.0,
      'afterDiscount': 30.0,
      'mg': 500,
      'tablets': 24,
    },
    {
      'photo': setPhoto(
          kind: 0,  // Change this to 0 as the image is not SVG
          width: 142,  // Adjust width and height as per your need
          height: 105,
          path: "assets/images/medicine_image.jpg"),
      'storeName': 'A1-Dawlia Medical N-Pharma',
      'offer': 15,
      'medicineName': 'Panadol COLD & FLU DAY',
      'beforeDiscount': 45.0,
      'afterDiscount': 30.0,
      'mg': 500,
      'tablets': 24,
    },
    {
      'photo': setPhoto(
          kind: 0,  // Change this to 0 as the image is not SVG
          width: 142,  // Adjust width and height as per your need
          height: 105,
          path: "assets/images/medicine_image.jpg"),
      'storeName': 'A1-Dawlia Medical N-Pharma',
      'offer': 15,
      'medicineName': 'Panadol COLD & FLU DAY',
      'beforeDiscount': 45.0,
      'afterDiscount': 30.0,
      'mg': 500,
      'tablets': 24,
    },
    {
      'photo': setPhoto(
          kind: 0,  // Change this to 0 as the image is not SVG
          width: 142,  // Adjust width and height as per your need
          height: 105,
          path: "assets/images/medicine_image.jpg"),
      'storeName': 'A1-Dawlia Medical N-Pharma',
      'offer': 15,
      'medicineName': 'Panadol COLD & FLU DAY',
      'beforeDiscount': 45.0,
      'afterDiscount': 30.0,
      'mg': 500,
      'tablets': 24,
    },
    {
      'photo': setPhoto(
          kind: 0,  // Change this to 0 as the image is not SVG
          width: 142,  // Adjust width and height as per your need
          height: 105,
          path: "assets/images/medicine_image.jpg"),
      'storeName': 'A1-Dawlia Medical N-Pharma',
      'offer': 15,
      'medicineName': 'Panadol COLD & FLU DAY',
      'beforeDiscount': 45.0,
      'afterDiscount': 30.0,
      'mg': 500,
      'tablets': 24,
    },
    // Add more items as needed
  ];

  MedicineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(right: 5.0, left: 5.0, top: 5.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items.map((item) {
              return Stack(
                children: [
                  Container(
                    height: 283,
                    width: 160,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: HexColor(placeholder),
                      ),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    margin: const EdgeInsets.only(right: 16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Column(
                        children: [
                          item['photo'], // Use the icon directly
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['medicineName'],
                                  style: const TextStyle(
                                    overflow: TextOverflow.clip,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                  ),
                                  maxLines: 1, // Ensure single line with ellipsis
                                ),
                                Text(
                                  '${item['mg']}mg / ${item['tablets']} tablets',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#AAAAAA"),
                                    fontSize: 10,
                                  ),
                                  maxLines: 1, // Ensure single line with ellipsis
                                  overflow: TextOverflow.clip,
                                ),
                                const SizedBox(height: 6.84),
                                Row(
                                  children: [
                                    setPhoto(
                                        kind: 1,
                                        width: 15,
                                        height: 13,
                                        path: "assets/icons/home.svg"),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        item['storeName'],
                                        style: const TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                        maxLines: 1, // Ensure single line with ellipsis
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 40),
                                Row(
                                  children: [
                                    Text(
                                      'EGP ${item['afterDiscount']}',
                                      style: const TextStyle(

                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(width: 23),
                                    Expanded(
                                      child: Text(
                                        'EGP ${item['beforeDiscount']}',
                                        style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#AAAAAA"),
                                          fontSize: 10,
                                          decoration: TextDecoration.lineThrough,
                                          decorationColor: HexColor("#AAAAAA"), // Set line-through color
                                        ),
                                        maxLines: 1, // Ensure single line with ellipsis
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          InkWell(child: setPhoto(kind: 1,path: "assets/icons/add_cart.svg"),)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 28,
                    child: Container(

                      decoration:  BoxDecoration(
                        color:HexColor("#34CC67"),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9.0,vertical:3),
                        child: Text(
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w600,
                          ),
                          '${item['offer']}%\nOFF',

                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
