import 'package:dropdown_button2/dropdown_button2.dart';
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
  CountryListDataModel? _countryChoose;
  List<CountryListDataModel> countryDataList = [
    CountryListDataModel("Egypt", "assets/icons/Password-field.svg"),
    CountryListDataModel("Tunisia", "assets/icons/TN.svg"),
  ];
  @override
  void initState() {
    super.initState();
    _countryChoose = null;
  }

  void _onDropDownItemSelected(CountryListDataModel newSelectedBank) {
    setState(() {

      _countryChoose != newSelectedBank
          ? _countryChoose = newSelectedBank
          : _countryChoose = null;
    });
  }

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: SingleChildScrollView(
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
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 35),
          Stepper(
            connectorThickness: 0,
            margin: const EdgeInsets.all(20),
            currentStep: _current_step,
            steps: getSteps(),
            controlsBuilder: (context, _) {
              if (_current_step == 0) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 15.09),
                      commonMaterialBtn(
                          width: MediaQuery.of(context).size.width / 2.44,
                          label: 'Next',
                          photoPath: 'assets/icons/arrow-right.svg',
                          txtBtnColor: white100,
                          function: () => onStepContinue(),
                          containerColor: primaryColor,
                          borderColor: primaryColor,
                          hasIcon: true)
                    ]);
              } else if (_current_step == 3) {
                return Row(mainAxisSize: MainAxisSize.max, children: [
                  commonMaterialBtn(
                      hasIcon: true,
                      swapIcon: true,
                      containerColor: white100,
                      width: MediaQuery.of(context).size.width / 2.44,
                      label: 'Previous',
                      photoPath: 'assets/icons/back_arrow.svg',
                      txtBtnColor: primaryColor,
                      function: () => onStepCancel(),
                      borderColor: primaryColor),
                  SizedBox(width: MediaQuery.of(context).size.width / 15.09),
                  commonMaterialBtn(
                      width: MediaQuery.of(context).size.width / 2.44,
                      label: 'Done',
                      photoPath: 'assets/icons/arrow-right.svg',
                      txtBtnColor: white100,
                      function: () => onStepContinue(),
                      containerColor: primaryColor,
                      borderColor: primaryColor,
                      hasIcon: false)
                ]);
              } else {
                return Row(mainAxisSize: MainAxisSize.max, children: [
                  commonMaterialBtn(
                      hasIcon: true,
                      swapIcon: true,
                      containerColor: white100,
                      width: MediaQuery.of(context).size.width / 2.44,
                      label: 'Previous',
                      photoPath: 'assets/icons/back_arrow.svg',
                      txtBtnColor: primaryColor,
                      function: () => onStepCancel(),
                      borderColor: primaryColor),
                  SizedBox(width: MediaQuery.of(context).size.width / 15.09),
                  commonMaterialBtn(
                      width: MediaQuery.of(context).size.width / 2.44,
                      label: 'Next',
                      photoPath: 'assets/icons/arrow-right.svg',
                      txtBtnColor: white100,
                      function: () => onStepContinue(),
                      containerColor: primaryColor,
                      borderColor: primaryColor,
                      hasIcon: true)
                ]);
              }
            },
            onStepTapped: (step) => setState(() {
              _current_step = step;
            }),
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
                  onPressed: () {
                    navigateTo(context, LoginScreen.routeName);
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
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'Name*',
                textType: TextInputType.text,
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            SizedBox(
              height: 61.2,
              child: DropdownButtonFormField2<CountryListDataModel>(
                decoration: InputDecoration(
                  labelText: "Country*",
                  labelStyle: TextStyle(
                      color:_countryChoose != null?HexColor(primaryColor):HexColor(hint),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0.h, horizontal: 15.0.w),
                  enabledBorder: _countryChoose != null
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: HexColor(primaryColor),
                              width: 1.0), // Change the color as desired
                        )
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                              color: HexColor(placeholder),
                              width: 1.0), // Change the color as desired
                        ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(

                        color: HexColor(primaryColor),
                        width: 1.0), // Change the color as desired
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // Add more decoration..
                ),
                iconStyleData: IconStyleData(
                    openMenuIcon: const Icon(Icons.arrow_drop_up),
                    iconEnabledColor: HexColor(dark),
                    iconDisabledColor: HexColor(dark)),
                dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                )),
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor(dark),
                  fontFamily: "Poppins",
                ),
                items: countryDataList
                    .map<DropdownMenuItem<CountryListDataModel>>(
                        (CountryListDataModel value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        setPhoto(
                          kind: 1,
                          path: value.country_logo_path,
                        ),
                        // Icon(valueItem.bank_logo),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(value.country_name),
                      ],
                    ),
                  );
                }).toList(),
                isExpanded: true,
                isDense: true,
                value: _countryChoose,
                onChanged: (CountryListDataModel? newSelectedCountry) {
                  _onDropDownItemSelected(newSelectedCountry!);

                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            SizedBox(
              height: 61.2,
              child: DropdownButtonFormField2<CountryListDataModel>(
                decoration: InputDecoration(



                  labelText: "Government*",
                  labelStyle: TextStyle(
                      color:_countryChoose != null?HexColor(primaryColor):HexColor(hint),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0.h, horizontal: 15.0.w),
                  enabledBorder: _countryChoose != null
                      ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        color: HexColor(primaryColor),
                        width: 1.0), // Change the color as desired
                  )
                      : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        color: HexColor(placeholder),
                        width: 1.0), // Change the color as desired
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(

                        color: HexColor(primaryColor),
                        width: 1.0), // Change the color as desired
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // Add more decoration..
                ),
                iconStyleData: IconStyleData(
                    openMenuIcon: const Icon(Icons.arrow_drop_up),
                    iconEnabledColor: HexColor(dark),
                    iconDisabledColor: HexColor(dark)),
                dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    )),
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor(dark),
                  fontFamily: "Poppins",
                ),
                items: countryDataList
                    .map<DropdownMenuItem<CountryListDataModel>>(
                        (CountryListDataModel value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            setPhoto(
                              kind: 1,
                              path: value.country_logo_path,
                            ),
                            // Icon(valueItem.bank_logo),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(value.country_name),
                          ],
                        ),
                      );
                    }).toList(),
                isExpanded: true,
                isDense: true,
                value: _countryChoose,
                onChanged: (CountryListDataModel? newSelectedCountry) {
                  _onDropDownItemSelected(newSelectedCountry!);

                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            SizedBox(
              height: 61.2,
              child: DropdownButtonFormField2<CountryListDataModel>(
                decoration: InputDecoration(



                  labelText: "Region*",
                  labelStyle: TextStyle(
                      color:_countryChoose != null?HexColor(primaryColor):HexColor(hint),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0.h, horizontal: 15.0.w),
                  enabledBorder: _countryChoose != null
                      ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        color: HexColor(primaryColor),
                        width: 1.0), // Change the color as desired
                  )
                      : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(
                        color: HexColor(placeholder),
                        width: 1.0), // Change the color as desired
                  ),
                  focusedBorder: OutlineInputBorder(

                    borderRadius: BorderRadius.circular(4.0),
                    borderSide: BorderSide(

                        color: HexColor(primaryColor),
                        width: 1.0), // Change the color as desired
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  // Add more decoration..
                ),
                iconStyleData: IconStyleData(
                    openMenuIcon: const Icon(Icons.arrow_drop_up),
                    iconEnabledColor: HexColor(dark),
                    iconDisabledColor: HexColor(dark)),
                dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    )),
                style: TextStyle(
                  fontSize: 14,
                  color: HexColor(dark),
                  fontFamily: "Poppins",
                ),
                items: countryDataList
                    .map<DropdownMenuItem<CountryListDataModel>>(
                        (CountryListDataModel value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            setPhoto(
                              kind: 1,
                              path: value.country_logo_path,
                            ),
                            // Icon(valueItem.bank_logo),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(value.country_name),
                          ],
                        ),
                      );
                    }).toList(),
                isExpanded: true,
                isDense: true,
                value: _countryChoose,
                onChanged: (CountryListDataModel? newSelectedCountry) {
                  _onDropDownItemSelected(newSelectedCountry!);

                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Address*',
                textType: TextInputType.streetAddress,
                controller: _addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                function: () {
                  print("object");
                },
                isCustomIcon: true,
                photoHight: MediaQuery.of(context).size.height / 16,
                suffixIconPth: "assets/icons/Group 61.svg",
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
                isCustomIcon: true,
                suffixIconPth: "assets/icons/filled.svg",
                label: 'License number',
                photoHight: MediaQuery.of(context).size.height / 16,
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
                isCustomIcon: true,
                suffixIconPth: "assets/icons/filled.svg",
                label: 'Commercial register',
                photoHight: MediaQuery.of(context).size.height / 16,
                textType: TextInputType.text,
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
                textType: TextInputType.text,
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
                textType: TextInputType.text,
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
                textType: TextInputType.emailAddress,
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
                isPassword: true,
                suffixIconData: Icons.visibility_off_outlined,
                label: 'Password*',
                textType: TextInputType.visiblePassword,
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

class CountryListDataModel {
  String country_name;
  String country_logo_path;
  CountryListDataModel(this.country_name, this.country_logo_path);
}
