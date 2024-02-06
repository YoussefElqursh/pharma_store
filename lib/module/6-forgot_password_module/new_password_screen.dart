import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/6-forgot_password_module/password_changed_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import 'forgot_password_screen.dart';

class NewPasswordScreen extends StatefulWidget {
  static const String routeName = 'NewPasswordScreenRoute';
  const NewPasswordScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const NewPasswordScreen(),
    );
  }

  State<NewPasswordScreen> createState() => _ResetViaEmailScreenState();
}

class _ResetViaEmailScreenState extends State<NewPasswordScreen> {
  final _passController1 = TextEditingController();
  final _passController2 = TextEditingController();

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
                  navigateTo(context, ForgotPasswordScreen.routeName);
                },
                child: setPhoto(
                    kind: 1,
                    path: 'assets/icons/arrow-left.svg',
                    height: 24,
                    width: 24),
              ),
            ]),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "New password",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: HexColor(dark)),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 171.34),
                Text('Your new password must be different from previous used passwords.',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins',
                        fontSize: 14.sp,
                        color: HexColor(dark))),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                commonInputField(
                    isPassword: true,
                    suffixIcon: Icons.visibility_off_outlined,
                    label: 'New password*',
                    textType: TextInputType.visiblePassword,
                    controller: _passController1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter pass ';
                      }
                      return null;
                    }),
                SizedBox(height: MediaQuery.of(context).size.height / 42.835),

                commonInputField(
                    isPassword: true,
                    label: 'confirm password*',

                    textType: TextInputType.visiblePassword,
                    controller: _passController2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter pass ';
                      }
                      return null;
                    }),
                SizedBox(height: MediaQuery.of(context).size.height / 21.147),
                commonMaterialBtn(
                    label: 'Reset',
                    function: () {
                      if (_formKey.currentState!.validate()) {
                        navigateTo(context, PasswordChangedScreen.routeName);

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
