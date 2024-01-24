import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreenRoute';
  const SplashScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      navigateToWithoutBack(context, const ChooseLanguageScreen());
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/3),

                setPhoto(kind: 1, path: "assets/images/Logo.svg", width: 70.w, height: 70.h),

                SizedBox(height: 10.h),

                Text(
                  'Pharma',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: HexColor(dark)),
                  textAlign: TextAlign.center,
                ),

                Text(
                  'Store',
                  style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: HexColor(dark)),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: MediaQuery.of(context).size.height/4),

                CircularProgressIndicator(
                  color: HexColor(primaryColor),
                )
              ]),
        ),
      ),
    );
  }
}
