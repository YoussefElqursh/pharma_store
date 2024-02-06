import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../model/onboarding_model/onboarding_model.dart';
import '../../shared/components/constrants.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import '../4-getstarted_module/getstarted_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String routeName = 'OnBoardingRoute';
  const OnBoardingScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OnBoardingScreen(),
    );
  }

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageViewController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton(
                style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {
                    navigateToWithoutBack(context, const GetStartedScreen());
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(color: HexColor(primaryColor),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Poppins",
                        fontStyle:  FontStyle.normal,
                        fontSize: 16.0),
                  )),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: pageViewController,
                  onPageChanged: (int index) {
                    if (index == boardingList.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      onBoardingItem(boardingList[index]),
                  itemCount: boardingList.length),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Row(
                children: [
                  SmoothPageIndicator(
                      controller: pageViewController,
                      effect: ExpandingDotsEffect(
                        dotColor: HexColor(placeholder),
                        activeDotColor: HexColor(primaryColor),
                        dotHeight: 6.h,
                        expansionFactor: 4,
                        dotWidth: 6.w,
                        spacing: 5,
                      ),
                      count: boardingList.length),
                  const Spacer(),
                  FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          navigateToWithoutBack(context, const GetStartedScreen());
                        } else {
                          pageViewController.nextPage(
                              duration: const Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      backgroundColor: HexColor(primaryColor),
                      shape: const CircleBorder(),
                      elevation: 0.0,
                      child: setPhoto(kind: 1, path: "assets/icons/arrow_forward_ic.svg", width: 17.w, height: 12.h),),
                ],
              ),
            )
          ],
        ));
  }
}

//this function of item that's use to how the specification of our project and it contain from 3 pages.
Widget onBoardingItem(OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 54.0),
          child: Center(child: SvgPicture.asset(model.image)),
        ),
        SizedBox(height: 30.h),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Text(model.headText,
              style: TextStyle(
                  color: HexColor(primaryColor),
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  fontStyle:  FontStyle.normal,
                  fontSize: 22.0.sp),
              textAlign: TextAlign.center),
        )),
        SizedBox(height: 12.h),
        Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 12.0),
          child: Text(model.subText,
              style: TextStyle(
                  color: HexColor(darkGray),
                  fontWeight: FontWeight.w300,
                  fontFamily: "Poppins",
                  fontStyle:  FontStyle.normal,
                  fontSize: 14.0.sp),
              textAlign: TextAlign.center),
        )),
        SizedBox(height: 20.h),
      ],
    );
