import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/styles/colors.dart';

class CustomNavBarIcon extends StatelessWidget {
  final String iconPath;
  final bool isSelected;

  const CustomNavBarIcon({
    super.key,
    required this.iconPath,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      colorFilter: ColorFilter.mode(
        isSelected ? HexColor(primaryColor) : HexColor("#AAAAAA"),
        BlendMode.srcIn,
      ),
    );
  }
}
