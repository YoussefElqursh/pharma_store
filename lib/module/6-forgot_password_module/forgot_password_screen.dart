import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/5-login_module/login_screen.dart';
import 'package:pharma_store/shared/components/components.dart';

import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = 'ForgotPasswordScreenRoute';
  const ForgotPasswordScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ForgotPasswordScreen(),
    );
  }

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String? selectedValue;
  bool clicked1 = false;
  bool clicked2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/10),
          child: Padding(
            padding: const EdgeInsets.only(top: 58, left: 19),
            child:

            Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [InkWell(
                  onTap: () {
                    navigateTo(context, LoginScreen.routeName);
                  },

                  child: setPhoto(
                      kind: 1,
                      path: 'assets/icons/arrow-left.svg',
                      height: 24,
                      width: 24),
                ),]
            ),)


      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Forgot password",
              style: TextStyle(
                color: HexColor(dark),
                fontStyle: FontStyle.normal,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
                "Select an option to send verification code to reset your password.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.sp,
                    color: HexColor(dark))),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            Container(
              width: 350.w,
              height: 107.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.w,
                      color: clicked1
                          ? HexColor(primaryColor)
                          : HexColor(placeholder)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: ShapeDecoration(
                            color:
                                clicked1 ? HexColor(accent) : HexColor(white95),
                            shape: const OvalBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: setPhoto(
                                kind: 1, path: 'assets/icons/phone.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reset via SMS",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                color: clicked1
                                    ? HexColor(primaryColor)
                                    : HexColor(dark))),
                        const SizedBox(height: 5),
                        Text("Verification code will be send",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                color: HexColor(darkGray))),
                        Text("to 012******05.",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                color: HexColor(darkGray))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Radio<String>(
                    value: 'Option 1',
                    activeColor: HexColor(primaryColor),
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        clicked1 = true;
                        clicked2 = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 40),
            Container(
              width: 350.w,
              height: 107.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1.w,
                      color: clicked2
                          ? HexColor(primaryColor)
                          : HexColor(placeholder)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: ShapeDecoration(
                            color:
                                clicked2 ? HexColor(accent) : HexColor(white95),
                            shape: const OvalBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: setPhoto(
                                kind: 1, path: 'assets/icons/email.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reset via Email",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 14.sp,
                                color: clicked2
                                    ? HexColor(primaryColor)
                                    : HexColor(dark))),
                        const SizedBox(height: 5),
                        Text("Verification code will be send",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                color: HexColor(darkGray))),
                        Text("to ma******@gmail.com.",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.sp,
                                color: HexColor(darkGray))),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Radio<String>(
                    value: 'Option 2',
                    activeColor: HexColor(primaryColor),
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                        clicked1 = false;
                        clicked2 = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 20),
            commonMaterialBtn(
                label: "Select",
                function: () {
                  if (selectedValue=="Option 1") {
                    navigateTo(context, 'ResetViaSmsScreenRoute');
                  } else if (selectedValue=="Option 2") {
                    navigateTo(context, 'ResetViaEmailScreenRoute');

                  } else {
                    if (kDebugMode) {
                      print("no one");
                    }
                  }
                },
                width: double.infinity),
          ],
        ),
      ),
    );
  }
}
