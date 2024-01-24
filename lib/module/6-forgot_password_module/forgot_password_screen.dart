import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),

            Text("Forgot password",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: HexColor(dark)),
              textAlign: TextAlign.left,
            ),

            Text("Select an option to send verification code to reset your password.",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    color: HexColor(dark))),

            SizedBox(height: MediaQuery.of(context).size.height / 20),

            Container(
              width: 320.w,
              height: 107.h,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.w, color: HexColor(placeholder)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 45.w,
                          height: 45.h,
                          decoration: ShapeDecoration(
                            color: HexColor(white95),
                            shape: const OvalBorder(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: setPhoto(kind: 1, path: 'assets/icons/phone.svg'),
                          ),
                        ),
                      ),

                      const SizedBox()
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Reset via SMS", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: HexColor(dark))),

                        const SizedBox(height: 5),

                        Text("Verification code will be send", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, color: HexColor(darkGray))),

                        Text("to your phone number.", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12.sp, color: HexColor(darkGray))),
                      ],
                    ),
                  ),

                  const Spacer(),

                  Radio<String>(
                    value: 'Option 1',
                    fillColor: MaterialStatePropertyAll(HexColor(primaryColor)),
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height / 40),

            // Container(
            //   width: double.infinity,
            //   height: 107,
            //   decoration: ShapeDecoration(
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //       side: BorderSide(width: 1, color: HexColor(placeholder)),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(20.0),
            //         child: Container(
            //           width: 45,
            //           height: 45,
            //           decoration: ShapeDecoration(
            //             color: HexColor(white95),
            //             shape: const OvalBorder(),
            //           ),
            //           child: const Icon(Icons.email_outlined,weight: 0.9),
            //         ),
            //       ),
            //
            //       Padding(
            //         padding: const EdgeInsets.symmetric(vertical: 20.0),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text("Reset via Email", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: HexColor(dark))),
            //
            //             const SizedBox(height: 5),
            //
            //             Text("Verification code will be send", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: HexColor(darkGray))),
            //
            //             Text("to your email address.", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: HexColor(darkGray))),
            //           ],
            //         ),
            //       ),
            //
            //       const Spacer(),
            //
            //       Radio<String>(
            //         value: 'Option 2',
            //         fillColor: MaterialStatePropertyAll(HexColor(primaryColor)),
            //         groupValue: selectedValue,
            //         onChanged: (value) {
            //           setState(() {
            //             selectedValue = value!;
            //           });
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
