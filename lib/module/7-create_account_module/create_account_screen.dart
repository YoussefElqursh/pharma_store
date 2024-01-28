import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/5-login_module/login_screen.dart';
import 'package:pharma_store/module/6-forgot_password_module/verify_phone_number_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = 'CreateAccountScreenRoute';
  const CreateAccountScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CreateAccountScreen(),
    );
  }

  State<CreateAccountScreen> createState() => _ResetViaSmsScreenState();
}

class _ResetViaSmsScreenState extends State<CreateAccountScreen> {
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _contactnumberController = TextEditingController();
  final _governmentController = TextEditingController();
  final _regionController = TextEditingController();
  final _addressController = TextEditingController();
  final _commercialController = TextEditingController();
  final _licensenumberController = TextEditingController();
  final _photoController = TextEditingController();

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
                    navigateTo(context, LoginScreen.routeName);
                  },

                  child: setPhoto(
                      kind: 1,
                      path: 'assets/icons/arrow-left.svg',
                      height: 24,
                      width: 24),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/1.730
                ),
                Text("Step 1 of 2",
                  style: TextStyle(color:HexColor(primaryColor),fontWeight:FontWeight.w500 ,fontFamily: "Poppins",fontSize: 14),
                )]
            ),)


      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 15, left: 20,right: 20,bottom: MediaQuery.of(context).size.width/19.338),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Create account",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600,color: HexColor(dark)),
                  textAlign: TextAlign.left,),
                SizedBox(height: MediaQuery.of(context).size.height / 200),


                Text("Account information.",style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    fontFamily: 'Poppins',
                    color: HexColor(dark))),

                SizedBox(height:MediaQuery.of(context).size.height / 20),
                commonInputField(

                    label: 'Name*',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Country*',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Government*',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Region*',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Address*',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Contact number*',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Commercial register',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'License number',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 42.835),
                commonInputField(

                    label: 'Photo',
                    textType: TextInputType.phone,
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter phone number';
                      }
                      return null;
                    }
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 21.4175),
                commonMaterialBtn(
                    label: 'Next',
                    function: (){
                      if(_formKey.currentState!.validate()){

                      }
                    },
                    width: double.infinity
                ),
                SizedBox(height:MediaQuery.of(context).size.height / 85.67),

                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Already have an account? ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Poppins",
                          color: HexColor(dark))),

                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            color: HexColor(primaryColor)),
                      ))
                ]),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
