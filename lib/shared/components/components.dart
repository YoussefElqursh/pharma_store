import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';
import 'functions.dart';

//this is widget use to make stander MaterialBtn in app
Widget commonMaterialBtn({
  @required String? label,
  @required function,
  @required width,
  bool hasIcon = false,
  String txtBtnColor = white100,
  String containerColor = primaryColor,
  String borderColor = primaryColor,
  String photoPath = "",
  bool swapIcon = false,
}) =>
    Container(
      decoration: BoxDecoration(
          border: Border.all(color: HexColor(borderColor)),
          borderRadius: BorderRadius.circular(6),
          color: HexColor(containerColor)),
      child: MaterialButton(
        onPressed: function,
        height: 52.h,
        minWidth: width,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: hasIcon
            ? (swapIcon
                ? Row(
                    mainAxisSize: MainAxisSize.min, // Ensure tight layout
                    children: [
                      setPhoto(
                          kind: 1, path: photoPath, height: 10.67, width: 16),
                      const SizedBox(
                          width: 8), // Optional spacing between text and icon
                      Text(
                        label!,
                        style: TextStyle(color: HexColor(txtBtnColor)),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min, // Ensure tight layout
                    children: [
                      Text(
                        label!,
                        style: TextStyle(color: HexColor(txtBtnColor)),
                      ),
                      const SizedBox(
                          width: 8), // Optional spacing between text and icon

                      setPhoto(
                          kind: 1, path: photoPath, height: 10.67, width: 16),
                    ],
                  ))
            : Text(
                label!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: HexColor(txtBtnColor),
                  fontSize: 16.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );

//this is widget use to make stander TextBtn in app
Widget commonTextBtn({@required String? label, @required function}) => InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: HexColor(primaryColor),
              width: 1.w,
            ),
          ),
        ),
        child: Text(
          label!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: HexColor(primaryColor),
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

//this is widget use to make stander InputField in app
Widget commonInputField({
  TextInputType textType = TextInputType.text,
  TextEditingController? controller,
  Icon? prefixIcon,
  IconData? suffixIconData,
  String suffixIconPth = "",
  double cursorWidth = 2.0,
  double? photoHight,
  double? photowidth,
  bool isPassword = false,
  bool isCustomIcon = false,
  String suffixIconCol = placeholder,
  String? label,
  String? Function(String?)? validator,
  VoidCallback? function,
}) =>
    TextFormField(

      cursorWidth: cursorWidth,
      controller: controller,
      keyboardType: textType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label!,
        labelStyle: TextStyle(color: HexColor(hint),fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 14),
        border: const OutlineInputBorder(),
        contentPadding:
            EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 15.0.w),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
          color: HexColor(primaryColor),
          width: 1.0), // Change the color as desired
    ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor(placeholder), width: 1.0.w),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: isCustomIcon
            ? InkWell(
                onTap: function,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: setPhoto(
                      kind: 1,
                      path: suffixIconPth,
                      height: photoHight,
                      width: photowidth),
                ))
            : IconButton(
                onPressed: function,
                icon: Icon(suffixIconData,
                    color: HexColor(suffixIconCol), size: 25),
              ),
      ),
    );





