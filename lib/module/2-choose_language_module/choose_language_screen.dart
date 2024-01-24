import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/components/functions.dart';

import '../../shared/styles/colors.dart';

class ChooseLanguageScreen extends StatelessWidget {
  static const String routeName = 'LanguageScreenRoute';
  const ChooseLanguageScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ChooseLanguageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/9),

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

              SizedBox(height: MediaQuery.of(context).size.height/20),

              Text('قم باختيار لغتك المفضلة',style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: HexColor(black)),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 5.h),

              Text('Choose your default language ',style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: HexColor(darkGray)),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height/20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 105.w,
                    height: 114.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: HexColor(placeholder)),
                        borderRadius: BorderRadius.circular(6).w,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () { navigateTo(context, "OnBoardingRoute"); },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            setPhoto(kind: 1, path: "assets/images/EnglishLang.svg", width: 60.w, height: 45.h),
                            SizedBox(height: 12.h),
                             Text('ُEnglish',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp,
                                ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20.w),

                  Container(
                    width: 105.w,
                    height: 114.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1, color: HexColor(placeholder)),
                        borderRadius: BorderRadius.circular(6).w,
                      ),
                    ),
                    child: MaterialButton(
                      onPressed: () { navigateTo(context, "OnBoardingRoute"); },
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            setPhoto(kind: 1, path: "assets/images/ArabicLang.svg", width: 60.w, height: 45.h),
                            SizedBox(height: 12.h),
                             Text('العربية',
                              style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                            ),
                              textAlign: TextAlign.center,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
