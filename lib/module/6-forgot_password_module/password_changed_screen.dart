import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/6-forgot_password_module/verify_phone_number_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import '../5-login_module/login_screen.dart';
import 'forgot_password_screen.dart';

class PasswordChangedScreen extends StatefulWidget {
  static const String routeName = 'PasswordChangedScreenRoute';
  const PasswordChangedScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const PasswordChangedScreen(),
    );
  }

  State<PasswordChangedScreen> createState() => _ResetViaSmsScreenState();
}

class _ResetViaSmsScreenState extends State<PasswordChangedScreen> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 190, left: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                setPhoto(kind: 1, path: 'assets/icons/taddaaa_image.svg'),
            SizedBox(height: MediaQuery.of(context).size.height / 21.4175),



            Text(
                  "Password Changed! ",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,color: HexColor(dark)),
                  textAlign: TextAlign.left,),
                SizedBox(height: MediaQuery.of(context).size.height / 171.34),

                Text('''Your password has been changed 
                successfully. '''
                    ,
                    style: TextStyle(


                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    color: HexColor(dark))),
                SizedBox(height: MediaQuery.of(context).size.height / 21.4175),

                commonMaterialBtn(
                    label: 'Login',
                    function: (){
                      if(_formKey.currentState!.validate()){

                        navigateTo(context, LoginScreen.routeName);

                      }
                    },
                    width: double.infinity
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
