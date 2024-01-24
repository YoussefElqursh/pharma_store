import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/components/strings.dart';
import '../../shared/styles/colors.dart';

class GetStartedScreen extends StatelessWidget {
  static const String routeName = 'GetStartedRoute';
  const GetStartedScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const GetStartedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 10),

              setPhoto(kind: 1, path: getStartedImage),

              SizedBox(height: MediaQuery.of(context).size.height / 30),

              Text(getStartedHeadText,
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: HexColor(primaryColor),
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center),

              SizedBox(height: MediaQuery.of(context).size.height / 30),

              Text(getStartedBodyText,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: HexColor(darkGray),
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center),

              SizedBox(height: MediaQuery.of(context).size.height / 20),

              commonMaterialBtn(label: "Login", function: (){navigateTo(context, 'LoginScreenRoute');}, width: double.infinity),

              SizedBox(height: 5.h),

              Container(
                width: double.infinity,
                height: 52.h,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: HexColor(primaryColor)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: MaterialButton(
                  onPressed: () {  },
                  height: 52.h,
                  minWidth: double.infinity,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: HexColor(primaryColor),
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height / 30),

              commonTextBtn(label: 'Continue as a Guest', function: (){})

            ],
          ),
        ),
      ),
    );
  }
}
