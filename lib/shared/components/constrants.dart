import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/styles/colors.dart';
import '../../model/create_account_model/dropdown_model.dart';
import '../../model/onboarding_model/onboarding_model.dart';

// this is lis use to make different data in OnBoarding page view.
List<OnBoardingModel> boardingList = [
  OnBoardingModel(
      image: 'assets/images/onBoarding_img.svg',
      headText: 'Search for Drugs',
      subText:
          'Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.'),
  OnBoardingModel(
      image: 'assets/images/onBoarding_img.svg',
      headText: 'Order Drugs',
      subText:
          'Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.'),
  OnBoardingModel(
      image: 'assets/images/onBoarding_img.svg',
      headText: 'Receive Drugs',
      subText:
          'Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.'),
];

List<ListDataModel> countryDataList = [
  ListDataModel(
      infoName: 'Egypt',
      infoLogoPath: "assets/icons/Password-field.svg"),
  ListDataModel(
      infoName: 'Tunisia',
      infoLogoPath: "assets/icons/TN.svg"),
];

List<ListDataModel> governmentDataList = [
  ListDataModel(
      infoName: 'Alexandria'),
  ListDataModel(
      infoName: 'Tanta')
];

List<ListDataModel> regionDataList = [
  ListDataModel(
      infoName: 'Asfra 45st'),
  ListDataModel(
      infoName: 'Abo Qir'),
];

Widget privacyPolicyLinkAndTermsOfService() {
  return Container(
    alignment: Alignment.center,
    child: Center(
        child: Text.rich(TextSpan(
            text: 'By creating account, you agree to\nour ',
            style: TextStyle(fontSize: 12.sp,fontWeight: FontWeight.w400,
                fontFamily: "Poppins", color: Colors.black),
            children: <TextSpan>[
          TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                  fontSize: 12.sp,
                  color: HexColor(primaryColor),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins"),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // code to open / launch terms of service link here
                }),
          TextSpan(
              text: ' and ',
              style: TextStyle(fontSize: 12.sp, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                      color: HexColor(primaryColor),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // code to open / launch privacy policy link here
                      })
              ])
        ]))),
  );
}
