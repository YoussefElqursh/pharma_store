import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/create_account_model/dropdown_model.dart';
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
  var photoPath,
  bool swapIcon = false,
}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: HexColor(borderColor)),
        borderRadius: BorderRadius.circular(6),
        color: HexColor(containerColor)),
    child: MaterialButton(
      onPressed: function,
      height: 48.h,
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
}

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
  String? txtFileName,
  TextInputType textType = TextInputType.text,
  TextEditingController? controller,
  Icon? prefixIcon,
  IconData? suffixIconData,
  String? suffixIconPth,
  double cursorWidth = 2.0,
  bool isReadOnly = false,
  double? photoHeight,
  double? photoWidth,
  String? hintTxt,
  bool isPassword = false,
  bool isCustomIcon = false,
  String suffixIconCol = placeholder,
  String? label,
  String? Function(String?)? validator,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      readOnly: isReadOnly,
      cursorWidth: cursorWidth,
      controller: controller,
      keyboardType: textType,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintTxt,
        labelText: label!,
        labelStyle: TextStyle(
            color: HexColor(hint),
            fontFamily: "Poppins",
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
                onTap: suffixPressed,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: setPhoto(
                      kind: 1,
                      path: suffixIconPth,
                      height: photoHeight,
                      width: photoWidth),
                ))
            : IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffixIconData,
                    color: HexColor(suffixIconCol), size: 25),
              ),
      ),
    );

Widget commonDropDownField(
    {String? Function(ListDataModel?)? validator, // New validator argument
    required itemChoose,
    required String labelTxt,
    String? infPhotoPath,
    required List<ListDataModel> itemDataList,
    required bool isValidationInProgress,
    required Function onDropDownItemSelected}) {
  double height = (isValidationInProgress ? 80.0 : 61.2);

  return SizedBox(
    height: height, // Adjust height based on whether there's an error

    child: DropdownButtonFormField2<ListDataModel>(
      validator: validator, // Assign validator to DropdownButtonFormField
      decoration: InputDecoration(
        labelText: labelTxt,
        labelStyle: TextStyle(
            color: HexColor(hint),
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            fontSize: 14),
        contentPadding:
            EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 15.0.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
              color: HexColor(placeholder),
              width: 1.0), // Change the color as desired
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(
              color: HexColor(primaryColor),
              width: 1.0), // Change the color as desired
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
// Add more decoration..
      ),
      iconStyleData: IconStyleData(
          openMenuIcon: const Icon(Icons.arrow_drop_up),
          iconEnabledColor: HexColor(dark),
          iconDisabledColor: HexColor(dark)),
      dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      )),
      style: TextStyle(
        fontSize: 14,
        color: HexColor(dark),
        fontFamily: "Poppins",
      ),
      items: itemDataList
          .map<DropdownMenuItem<ListDataModel>>((ListDataModel value) {
        return DropdownMenuItem(
          value: value,
          child: value.infoLogoPath != null
              ? Row(
                  children: [
                    setPhoto(
                      kind: 1,
                      path: value.infPhotoPath,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(value.infoName),
                  ],
                )
              : Row(
                  children: [
                    Text(value.infoName),
                  ],
                ),
        );
      }).toList(),
      isExpanded: true,
      isDense: true,
      value: itemChoose,
      onChanged: (ListDataModel? newSelectedCountry) {
        onDropDownItemSelected(newSelectedCountry!);
      },
    ),
  );
}
