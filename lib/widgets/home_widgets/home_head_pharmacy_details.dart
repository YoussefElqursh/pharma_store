import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/components/functions.dart';
import 'package:pharma_store/shared/styles/colors.dart';

class HeadPharmacyDetails extends StatefulWidget {
  const HeadPharmacyDetails({super.key});

  @override
  HeadPharmacyDetailsState createState() => HeadPharmacyDetailsState();
}

class HeadPharmacyDetailsState extends State<HeadPharmacyDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Image(
          image: AssetImage('assets/images/Avatar.jpg'),
          width: 40,
          height: 40,
        ),
        const SizedBox(width: 12),
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Elezaby",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600,fontFamily: 'Poppins'),),
            Row(
              children: [
                setPhoto(kind: 1,path: "assets/icons/location.svg"),
                const SizedBox(width: 1),
                const Text("Alexandria, AL Awayed",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,fontFamily: 'Poppins'),),
              ],
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 6.0,top: 1),
          child: Stack(
            clipBehavior: Clip.none, // Ensure children can overflow the stack
            children: [
              SizedBox(
                width: 30,
                height: 32,
                child: OutlinedButton(
                  onPressed: () {
                    // Add your onPressed function here
                  },
                  style: OutlinedButton.styleFrom(
                    side:  BorderSide(color: HexColor(placeholder)), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    padding: EdgeInsets.zero, // Remove default padding
                  ),
                  child: setPhoto(kind: 1,path: 'assets/icons/notif.svg'),
                ),
              ),
              const Positioned(
                top: -5,
                right: -5,
                child: CircleAvatar(
                  radius: 8.0,
                  backgroundColor: Colors.red,
                  child: Text(
                    "6",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
