import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/6-forgot_password_module/reset_via_sms_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import 'new_password_screen.dart';

class VerifyEmailScreen extends StatefulWidget {
  static const String routeName = 'VerifyEmailScreenRoute';
  const VerifyEmailScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const VerifyEmailScreen(),
    );
  }

  @override
  State<VerifyEmailScreen> createState() => _ResetViaSmsScreenState();
}

class _ResetViaSmsScreenState extends State<VerifyEmailScreen> {
  final _digitController1 = TextEditingController();
  final _digitController2 = TextEditingController();
  final _digitController3 = TextEditingController();
  final _digitController4 = TextEditingController();
  final _digitController5 = TextEditingController();
  final _digitController6 = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery.of(context).size.height / 10.447),
        child: Padding(
          padding: const EdgeInsets.only(top: 58, left: 19),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            InkWell(
              onTap: () {
                navigateTo(context, ResetViaSmsScreen.routeName);
              },
              child: setPhoto(
                  kind: 1,
                  path: 'assets/icons/arrow-left.svg',
                  height: 24,
                  width: 24),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Verify email ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: HexColor(dark)),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 171.34),
                Text(
                  "We’ve sent a verification code to ma***@gmail.com. Please check your email  and enter the code.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      color: HexColor(dark)),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextFormField(
                        controller: _digitController1,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "",
                          contentPadding: const EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(placeholder)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(primaryColor)),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextFormField(
                        controller: _digitController2,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "",
                          contentPadding: const EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(placeholder)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(primaryColor)),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextFormField(
                        controller: _digitController3,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "",
                          contentPadding: const EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(placeholder)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(primaryColor)),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextFormField(
                        controller: _digitController4,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "",
                          contentPadding: const EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(placeholder)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(primaryColor)),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextFormField(
                        controller: _digitController5,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "",
                          contentPadding: const EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(placeholder)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(primaryColor)),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: TextFormField(
                        controller: _digitController6,
                        validator: (value) {
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        keyboardType: TextInputType.number,
                        showCursor: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: "",
                          contentPadding: const EdgeInsets.all(12.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(placeholder)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: HexColor(primaryColor)),
                          ),
                        ),
                        style: TextStyle(
                          color: HexColor(primaryColor),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Didn’t receive the code? ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          color: HexColor(dark))),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: HexColor(primaryColor)),
                      ))
                ]),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                commonMaterialBtn(
                    label: 'Verify',
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        navigateTo(context, NewPasswordScreen.routeName);

                      }
                    },
                    width: double.infinity),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
