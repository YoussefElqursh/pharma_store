import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../styles/colors.dart';
import 'functions.dart';

//this is widget use to make stander MaterialBtn in app
Widget commonMaterialBtn(
        {@required String? label, @required function, @required width}) =>
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: HexColor(primaryColor)),
      child: MaterialButton(
        onPressed: function,
        height: 52.h,
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
  var suffixPth,
  double? IconContainerWidth,
  double? IconContainerHight,


  bool isPassword = false,
  bool containerWithColor = false,
  String suffixIconCol = placeholder,
  bool isCustomIcon = false,
  String? containerColor,
  String? label,
  String? Function(String?)? validator,
  VoidCallback? function2,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label!,
        labelStyle: TextStyle(color: HexColor(hint)),
        border: const OutlineInputBorder(),
        contentPadding:
            EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 15.0.w),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor(placeholder), width: 1.0.w),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: isCustomIcon
            ? InkWell(
                onTap: function2,
                child: Container(
                    margin: const EdgeInsetsDirectional.only(end: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: containerWithColor ? HexColor(containerColor!) : null,
                    ),
                    padding: const EdgeInsets.all(12.0),
                    width: IconContainerWidth,
                    height: IconContainerHight,
                    child: setPhoto(
                        kind: 1,
                        path: suffixPth,


                    )),
              )
            : IconButton(
                onPressed: function2,
                icon:
                     Icon(suffixIconData, color: HexColor(suffixIconCol),size: 25)
                    ,
              ),
      ),
    );

Widget commonMaterialBtnWithIconOnLeft(
        {@required String? label,
        @required width,
        required String pth,
        required String txtBtnColor,
        required function3,
        required String containerColor,
        required String borderColor}) =>
    InkWell(
      onTap: function3,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: 48.w,
        decoration: BoxDecoration(
            color: HexColor(containerColor),
            border: Border.all(color: HexColor(borderColor)),
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Ensure tight layout
          children: [
            setPhoto(kind: 1, path: pth, height: 10.67, width: 16),
            const SizedBox(width: 8), // Optional spacing between text and icon

            Text(
              label!,
              style: TextStyle(color: HexColor(txtBtnColor)),
            ),
          ],
        ),
      ),
    );

Widget commonMaterialBtnWithIconRight(
        {@required String? label,
        @required width,
        required String pth,
        required String txtBtnColor,
        required function3,
        required String containerColor,
        required String borderColor,
        required bool hasIcon}) =>
    InkWell(
      onTap: function3,
      child: Container(
          alignment: Alignment.center,
          height: 48.w,
          width: width,
          decoration: BoxDecoration(
              color: HexColor(containerColor),
              border: Border.all(color: HexColor(borderColor)),
              borderRadius: BorderRadius.circular(4)),
          child: (hasIcon)
              ? Row(
                  mainAxisSize: MainAxisSize.min, // Ensure tight layout
                  children: [
                    Text(
                      label!,
                      style: TextStyle(color: HexColor(txtBtnColor)),
                    ),
                    const SizedBox(
                        width: 8), // Optional spacing between text and icon

                    setPhoto(kind: 1, path: pth, height: 10.67, width: 16),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min, // Ensure tight layout
                  children: [
                    Text(
                      label!,
                      style: TextStyle(color: HexColor(txtBtnColor)),
                    ),
                  ],
                )),
    );
