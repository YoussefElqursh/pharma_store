import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/styles/colors.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    Key? key,
    this.width = 17.0,
    this.height = 17.0,
    this.color,
    this.iconSize,
    this.onChanged,
    this.checkColor,
  }) : super(key: key);

  final double width;
  final double height;
  final Color? color;
  // Now you can set the checkmark size of your own
  final double? iconSize;
  final Color? checkColor;
  final Function(bool?)? onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() => isChecked = !isChecked);
        widget.onChanged?.call(isChecked);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isChecked ? HexColor(primaryColor) : Colors.white, // Set background color here

          border: Border.all(

            color: isChecked ? HexColor(primaryColor) :  HexColor(placeholder), // Set color based on checked state

            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: isChecked
            ? Icon(
          Icons.check,
          size: 12,
          color: HexColor(white100),
        )
            : null,
      ),
    );
  }
}
