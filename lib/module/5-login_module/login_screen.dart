import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';


final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  static const String routeName = 'LoginScreenRoute';

  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/9.5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.h,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 3,
                            offset: Offset(0, 1),
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Color(0x4C000000),
                            blurRadius: 2,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: setPhoto(kind: 1, path: "assets/images/Logo.svg"),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height / 20),

                setPhoto(kind: 1, path: 'assets/images/Login.svg', width: 52.w, height: 22.h),

                Text("Login to your registered account.",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.sp)),

                SizedBox(height: MediaQuery.of(context).size.height / 20),

                commonInputField(
                    label: "Pharmacy license",
                    textType: TextInputType.number,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter Pharmacy license';
                      }
                      return null;
                    }),

                SizedBox(height: 20.h),

                commonInputField(
                    label: 'Password',
                    textType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    isPassword: true,
                    suffixIcon: Icons.remove_red_eye_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                      return 'please, Enter Password';
                      }
                      return null;
                    }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {navigateTo(context, 'ForgotPasswordScreenRoute');},
                        style: const ButtonStyle(overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                        child: Text("Forgot password?",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: HexColor(primaryColor),
                            )
                        ),
                    ),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height/20),

                commonMaterialBtn(
                    label: 'Login',
                    function: (){
                      if(_formKey.currentState!.validate()){

                      }
                    },
                    width: double.infinity
                ),

                SizedBox(height: 10.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?", style: TextStyle(
                       fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: HexColor(dark)
                    ),
                      textAlign: TextAlign.left,
                    ),

                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.transparent)),
                      child: Text("Create account",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: HexColor(primaryColor),
                          )
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                Center(child: commonTextBtn(label: 'Continue as a Guest', function: (){}))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
