import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import '../7-create_account_module/create_account_screen.dart';


final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreenRoute';

  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isChecked = false ;

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

                setPhoto(kind: 1, path: "assets/images/Logo.svg", width: 50.w, height: 50.h),

                SizedBox(height: MediaQuery.of(context).size.height / 20),

                setPhoto(kind: 1, path: 'assets/images/Login.svg', width: 52.w, height: 22.h),

                Text("Login to your registered account.",
                    style: TextStyle(
                        color: HexColor(dark),
                        fontWeight: FontWeight.w300,
                        fontFamily: "Poppins",
                        fontStyle:  FontStyle.normal,
                        fontSize: 14.0.sp)),

                SizedBox(height: MediaQuery.of(context).size.height / 20),

                commonInputField(
                    label: "Username",
                    textType: TextInputType.number,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter Username';
                      }
                      return null;
                    }),

                SizedBox(height: 20.h),

                commonInputField(
                    label: 'Password',
                    textType: TextInputType.visiblePassword,
                    controller: _passwordController,
                    isPassword: true,
                    suffixIconData: Icons.visibility_off_outlined,
                    validator: (value) {
                      if (value!.isEmpty) {
                      return 'please, Enter Password';
                      }
                      return null;
                    }
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                        overlayColor: MaterialStatePropertyAll(HexColor(placeholder)),
                        hoverColor: HexColor(hint),
                        side: BorderSide(color: HexColor(hint)),
                        value: isChecked,
                        onChanged: (value){setState(() {
                           isChecked = value!;
                           });
                        }),

                    Text(
                        "Remember me",
                        style: TextStyle(
                            color: isChecked? HexColor(primaryColor) : HexColor(hint),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            fontStyle:  FontStyle.normal,
                            fontSize: 12.0.sp
                        ),
                        textAlign: TextAlign.left
                    ),

                    const Spacer(),

                    TextButton(
                        onPressed: () {
                          navigateTo(context, 'ForgotPasswordScreenRoute');
                          },
                        style: const ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(Colors.white)
                        ),
                        child: Text("Forgot password?",
                            style: TextStyle(
                              color: HexColor(primaryColor),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle:  FontStyle.normal,
                                fontSize: 12.0.sp
                            ),
                            textAlign: TextAlign.left
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
                    Text("Don’t have an account?",
                      style: TextStyle(
                        color: HexColor(dark),
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          fontStyle:  FontStyle.normal,
                          fontSize: 12.0.sp
                      ),
                    textAlign: TextAlign.left
                    ),

                    TextButton(
                      onPressed: () {
                        navigateTo(context,  CreateAccountScreen.routeName);
                      },
                      style: const ButtonStyle(
                          overlayColor: MaterialStatePropertyAll(Colors.white)),
                      child: Text("Create account",
                          style: TextStyle(
                            color: HexColor(primaryColor),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle:  FontStyle.normal,
                              fontSize: 12.0
                          ),
                          textAlign: TextAlign.left
                      )
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
