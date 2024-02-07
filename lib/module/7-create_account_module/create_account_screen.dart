import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/5-login_module/login_screen.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constrants.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/custom_checkbox.dart';

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
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phonenumberController = TextEditingController();

  //final _formKey = GlobalKey<FormState>();
  int _current_step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 10),
          child: Padding(
            padding: const EdgeInsets.only(top: 58, left: 19),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              InkWell(
                onTap: () {
                  navigateTo(context, LoginScreen.routeName);
                },
                child: setPhoto(
                    kind: 1,
                    path: 'assets/icons/arrow-left.svg',
                    height: 24,
                    width: 24),
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 1.730),
            ]),
          )),
      body: SingleChildScrollView(
        child: Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create account",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: HexColor(dark)),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 220),
                  Text("We are happy to have you join us.",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          color: HexColor(dark))),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 35),
            SingleChildScrollView(
              child: Stepper(
                connectorThickness: 0,
                margin: const EdgeInsets.all(20),
                currentStep: _current_step,
                steps: getSteps(),
                controlsBuilder: (context, _){
                  if (_current_step == 0)
                { return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width / 13.09),
                            commonMaterialBtnWithIconRight(
                                width: MediaQuery.of(context).size.width / 2.44,
                                label: 'Next',
                                pth: 'assets/icons/arrow-right.svg',
                                txtBtnColor: white100,
                                function3: () => onStepContinue(),
                                containerColor: primaryColor,
                                borderColor: primaryColor, hasIcon: true)
                          ]);
                }else if (_current_step == 3){ return

                    Row(mainAxisSize: MainAxisSize.max, children: [
                        commonMaterialBtnWithIconOnLeft(
                            containerColor: white100,
                            width: MediaQuery.of(context).size.width / 2.44,
                            label: 'Previous',
                            pth: 'assets/icons/back_arrow.svg',
                            txtBtnColor: primaryColor,
                            function3: () => onStepCancel(),
                            borderColor: primaryColor),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 13.09),
                        commonMaterialBtnWithIconRight(
                            width: MediaQuery.of(context).size.width / 2.44,
                            label: 'Done',
                            pth: 'assets/icons/arrow-right.svg',
                            txtBtnColor: white100,
                            function3: () => onStepContinue(),
                            containerColor: primaryColor,
                            borderColor: primaryColor, hasIcon: false)
                      ]);
                  }
                  else{
                    return
                    Row(mainAxisSize: MainAxisSize.max, children: [
                      commonMaterialBtnWithIconOnLeft(
                          containerColor: white100,
                          width: MediaQuery.of(context).size.width / 2.44,
                          label: 'Previous',
                          pth: 'assets/icons/back_arrow.svg',
                          txtBtnColor: primaryColor,
                          function3: () => onStepCancel(),
                          borderColor: primaryColor),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 13.09),
                      commonMaterialBtnWithIconRight(
                          width: MediaQuery.of(context).size.width / 2.44,
                          label: 'Next',
                          pth: 'assets/icons/arrow-right.svg',
                          txtBtnColor: white100,
                          function3: () => onStepContinue(),
                          containerColor: primaryColor,
                          borderColor: primaryColor, hasIcon: true)
                    ]);

                  }
              },
                onStepTapped: (step) => setState(() {
                  _current_step = step;
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Poppins"),
                ),
                TextButton(
                    onPressed: () { navigateTo(context,  LoginScreen.routeName);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return <Step>[
      Step(
        title: Text(
          "STEP 1",
          style: TextStyle(
              color: HexColor(darkGray),
              fontSize: 10.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "Basic Details",
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'Name*',
                textType: TextInputType.phone,
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Country*',
                textType: TextInputType.phone,
                controller: _countryController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Government*',
                textType: TextInputType.phone,
                controller: _governmentController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Region*',
                textType: TextInputType.phone,
                controller: _regionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Address*',
                textType: TextInputType.phone,
                controller: _addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Contact number*',
                textType: TextInputType.phone,
                controller: _contactnumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
          ],
        ),
        isActive: _current_step >= 0,
        state: _current_step <= 0 ? StepState.indexed : StepState.complete,
      ),
      Step(
        title: Text("STEP 2",
            style: TextStyle(
                color: HexColor(darkGray),
                fontSize: 10.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500)),
        subtitle: Text("License & Verification",
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'License number',
                textType: TextInputType.phone,
                controller: _licensenumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Commercial register',
                textType: TextInputType.phone,
                controller: _commercialController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
          ],
        ),
        isActive: _current_step >= 1,
        state: _current_step <= 1 ? StepState.indexed : StepState.complete,
      ),
      Step(
        title: Text(
          "STEP 3",
          style: TextStyle(
              color: HexColor(darkGray),
              fontSize: 10.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "Pharmacist Details",
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'First name*',
                textType: TextInputType.phone,
                controller: _firstnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Last name*',
                textType: TextInputType.phone,
                controller: _lastnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Email',
                textType: TextInputType.phone,
                controller: _phonenumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Phone number*',
                textType: TextInputType.phone,
                controller: _licensenumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
          ],
        ),
        isActive: _current_step >= 2,
        state: _current_step <= 2 ? StepState.indexed : StepState.complete,
      ),
      Step(
        title: Text(
          "STEP 4",
          style: TextStyle(
              color: HexColor(darkGray),
              fontSize: 10.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          "Security Details",
          style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'Password*',
                textType: TextInputType.phone,
                controller: _passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2.0, right: 8.0),
                  child: CustomCheckbox(),
                ),
                privacyPolicyLinkAndTermsOfService()
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25.96),
          ],
        ),
        isActive: _current_step >= 3,
        state: _current_step <= 3 ? StepState.indexed : StepState.complete,
      )
    ];
  }

  onStepContinue() {
    final isLastStep = _current_step == getSteps().length - 1;
    if (isLastStep) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Form Submitted"),
              content: const Text("Your form has been submitted successfuly"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    } else {
      setState(() {
        _current_step++;
      });
    }
  } //to move next step and display the list in each step

  onStepCancel() {
    if (_current_step > 0) {
      setState(() {
        _current_step -= 1;
      });
    }
  } //to cancel and close the opened list and move the previous step
}
