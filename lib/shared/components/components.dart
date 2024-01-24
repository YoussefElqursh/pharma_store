import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';


//this is widget use to make stander MaterialBtn in app
Widget commonMaterialBtn({@required String? label, @required function, @required width}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: HexColor(primaryColor)
      ),
      child: MaterialButton(
        onPressed: function,
        height: 40.h,
        minWidth: width,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );

//this is widget use to make stander TextBtn in app
Widget commonTextBtn({@required String? label, @required function}) =>
    InkWell(
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
  IconData? suffixIcon,
  bool isPassword = false,
  String? label,
  String? Function(String?)? validator,
  VoidCallback? function2,
}) => TextFormField(
    controller: controller,
    keyboardType: textType,
    obscureText: isPassword,
    validator: validator,
    decoration: InputDecoration(
      labelText: label!,
      labelStyle: TextStyle(color: HexColor(placeholder)),
      border: const OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 15.0.w),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: HexColor(primaryColor), width: 2.0.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: HexColor(placeholder), width: 1.0.w),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: IconButton(
        onPressed: function2,
        icon: Icon(suffixIcon, color: HexColor(placeholder)),
      ),
    ),
  );