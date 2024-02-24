import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/6-forgot_password_module/verify_email_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import 'forgot_password_screen.dart';

class ResetViaEmailScreen extends StatefulWidget {
  static const String routeName = 'ResetViaEmailScreenRoute';
  const ResetViaEmailScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ResetViaEmailScreen(),
    );
  }

  @override
  State<ResetViaEmailScreen> createState() => _ResetViaEmailScreenState();
}

class _ResetViaEmailScreenState extends State<ResetViaEmailScreen> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height/10),
          child: Padding(
            padding: const EdgeInsets.only(top: 58, left: 19),
            child:

            Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [InkWell(
                  onTap: () {
                    navigateTo(context, ForgotPasswordScreen.routeName);
                  },

                  child: setPhoto(
                      kind: 1,
                      path: 'assets/icons/arrow-left.svg',
                      height: 24,
                      width: 24),
                ),]
            ),)


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Enter email",
                  style: TextStyle(fontSize: 20.sp, fontFamily: 'Poppins',fontWeight: FontWeight.w600,color: HexColor(dark)),
                  textAlign: TextAlign.left,),
                SizedBox(height: MediaQuery.of(context).size.height / 200),


                Text("Enter your email address to get an email with a verification code.",style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Poppins',
                    fontSize: 14.sp,
                    color: HexColor(dark))),

                SizedBox(height:MediaQuery.of(context).size.height / 20),
                commonInputField(


                    label: 'email',
                    textType: TextInputType.emailAddress,
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter email ';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 16),
                commonMaterialBtn(
                    label: 'Send',
                    function: (){
                      if(_formKey.currentState!.validate()){
                        navigateTo(context, VerifyEmailScreen.routeName);

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
