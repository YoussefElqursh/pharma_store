import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/Blocs/login_cubit/login_cubit.dart';

import '../../layout/home_layout/home_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/custom_checkbox.dart';
import '../7-create_account_module/create_account_screen.dart';

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
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginAuthCubit(),
      child: BlocConsumer<LoginAuthCubit, LoginAuthState>(
        listener: (context, state) {
          if (state is LoginAuthSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else if (state is LoginAuthErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 9.5),
                      setPhoto(
                        kind: 1,
                        path: "assets/images/Logo.svg",
                        width: 50.w,
                        height: 50.h,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      setPhoto(
                        kind: 1,
                        path: 'assets/images/Login.svg',
                        width: 52.w,
                        height: 22.h,
                      ),
                      Text(
                        "Login to your registered account.",
                        style: TextStyle(
                          color: HexColor(dark),
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0.sp,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      commonInputField(
                        label: "Username",
                        textType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, enter username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      commonInputField(
                        label: 'Password',
                        textType: TextInputType.visiblePassword,
                        controller: passwordController,
                        isPassword: true,
                        suffixIconData: Icons.visibility,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, enter password';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCheckbox(onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          }),
                          SizedBox(width: 5.w),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              color: isChecked ? HexColor(primaryColor) : HexColor(hint),
                              fontWeight: FontWeight.w500,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, 'ForgotPasswordScreenRoute');
                            },
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(Colors.white),
                            ),
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                color: HexColor(primaryColor),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0.sp,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      ConditionalBuilder(
                        condition: state is! LoginAuthLoadingState,
                        builder: (context) => commonMaterialBtn(
                          label: 'Login',
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginAuthCubit.get(context).userLogin(
                                password: passwordController.text,
                                username: emailController.text,
                              );
                              // Navigator.pushNamed(context, 'HomeScreenRoute');
                            }
                          },
                          width: double.infinity,
                        ),
                        fallback: (context) => const Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: TextStyle(
                              color: HexColor(dark),
                              fontWeight: FontWeight.w300,
                              fontFamily: "Poppins",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          TextButton(
                            onPressed: () {
                              navigateTo(context, CreateAccountScreen.routeName);
                            },
                            style: const ButtonStyle(
                              overlayColor: MaterialStatePropertyAll(Colors.white),
                            ),
                            child: Text(
                              "Create account",
                              style: TextStyle(
                                color: HexColor(primaryColor),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: commonTextBtn(label: 'Continue as a Guest', function: () {}),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
