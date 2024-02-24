import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/6-forgot_password_module/verify_phone_number_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import 'forgot_password_screen.dart';

class ResetViaSmsScreen extends StatefulWidget {
  static const String routeName = 'ResetViaSmsScreenRoute';
  const ResetViaSmsScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const ResetViaSmsScreen(),
    );
  }

  @override
  State<ResetViaSmsScreen> createState() => _ResetViaSmsScreenState();
}

class _ResetViaSmsScreenState extends State<ResetViaSmsScreen> {
  final _phoneController = TextEditingController();
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
                  "Enter phone number",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,color: HexColor(dark)),
              textAlign: TextAlign.left,),
                SizedBox(height: MediaQuery.of(context).size.height / 200),


                Text("Enter your phone number to get a SMS with a verification code.",style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    color: HexColor(dark))),

                SizedBox(height:MediaQuery.of(context).size.height / 20),
                commonInputField(

                    label: 'phone number',
                    textType: TextInputType.phone,
                    controller: _phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 16),
                commonMaterialBtn(
                    label: 'Send',
                    function: (){
                      if(_formKey.currentState!.validate()){

                        navigateTo(context, VerifyPhoneNumber.routeName);

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
