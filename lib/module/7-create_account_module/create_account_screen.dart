import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/5-login_module/login_screen.dart';
import '../../model/dropdown_model/dropdown_model.dart';
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
  final _contactnumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _commercialController = TextEditingController();
  final _pharmacyPhotoController = TextEditingController();

  final _licensenumberController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phonenumberController = TextEditingController();
  int _current_step = 0;
  ListDataModel? _countryChoose;
  List<ListDataModel> countryDataList = [
    ListDataModel(
        infoName: 'Egypt', infoLogoPath: "assets/icons/Password-field.svg"),
    ListDataModel(infoName: 'Tunisia', infoLogoPath: "assets/icons/TN.svg"),
  ];

  ListDataModel? _governmentChoose;
  List<ListDataModel> governmentDataList = [
    ListDataModel(infoName: 'Alexandria'),
    ListDataModel(infoName: 'Tanta')
  ];

  ListDataModel? _regionChoose;
  List<ListDataModel> regionDataList = [
    ListDataModel(infoName: 'Asfra 45st'),
    ListDataModel(infoName: 'Abo Qir'),
  ];

  @override
  void initState() {
    super.initState();
    _countryChoose = null;
    _governmentChoose = null;
    _regionChoose = null;
  }

  void _onDropDownItemSelectedCountry(ListDataModel newSelectedCountry) {
    setState(() {
      _countryChoose != newSelectedCountry
          ? _countryChoose = newSelectedCountry
          : _countryChoose = null;
    });
  }

  void _onDropDownItemSelectedGovernment(ListDataModel newSelectedGovernment) {
    setState(() {
      _governmentChoose != newSelectedGovernment
          ? _governmentChoose = newSelectedGovernment
          : _governmentChoose = null;
    });
  }

  _onDropDownItemSelectedRegion(ListDataModel newSelectedRegion) {
    setState(() {
      _regionChoose != newSelectedRegion
          ? _regionChoose = newSelectedRegion
          : _regionChoose = null;
    });
  }

  final GlobalKey<FormState> _step1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _step2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _step3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _step4Key = GlobalKey<FormState>();

  bool _validationInProgress = false;

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
                  bool hasValue = false;

                  // Check if any field in the stepper has a non-null value
                  if (_current_step <= 3) {
                    // Check for fields in step 1
                    if (_nameController.text.isNotEmpty ||
                        _addressController.text.isNotEmpty ||
                        _contactnumberController.text.isNotEmpty ||
                        _countryChoose != null ||
                        _governmentChoose != null ||
                        _regionChoose != null) {
                      hasValue = true;
                    }

                    // Check for fields in step 2
                    if (_licensenumberController.text.isNotEmpty ||
                        _commercialController.text.isNotEmpty ||
                        _pharmacyPhotoController.text.isNotEmpty) {
                      hasValue = true;
                    }

                    // Check for fields in step 3
                    if (_firstnameController.text.isNotEmpty ||
                        _lastnameController.text.isNotEmpty ||
                        _phonenumberController.text.isNotEmpty) {
                      hasValue = true;
                    }

                    // Check for fields in step 4
                    if (_passwordController.text.isNotEmpty) {
                      hasValue = true;
                    }
                  }

                  if (hasValue) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.all(24.0),
                          title: const Text(
                            "Discard creating account?",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins"),
                          ),
                          content: Text(
                            "Your data will be lost, are you sure you want to discard creating account?",
                            style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: HexColor(darkGray)),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel"),
                            ),
                            SizedBox(width: 31),
                            commonMaterialBtn(
                              containerColor: primaryColor,
                              label: "Discard",
                              function: () {
                                Navigator.pop(context);
                                navigateTo(context, LoginScreen.routeName);
                              },
                              width: 100.0,
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    navigateTo(context, LoginScreen.routeName);
                  }
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
            controller: ScrollController(),
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
        content: Form(
          key: _step1Key,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonInputField(
                  label: 'Name*',
                  textType: TextInputType.text,
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter Name';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonDropDownField(
                validator: (value) {
                  setState(() {
                    _validationInProgress = value ==
                        null; // Set to true if value is null (validation in progress)
                  });
                  if (value == null) {
                    return 'Please select a country';
                  }
                  return null; // Return null when the selection is valid
                },
                itemChoose: _countryChoose,
                labelTxt: "Country*",
                itemDataList: countryDataList,
                onDropDownItemSelected: _onDropDownItemSelectedCountry,
                isValidationInProgress: _validationInProgress,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonDropDownField(
                validator: (value) {
                  setState(() {
                    _validationInProgress = value ==
                        null; // Set to true if value is null (validation in progress)
                  });
                  if (value == null) {
                    return 'Please select a government';
                  }
                  return null; // Return null when the selection is valid
                },
                itemChoose: _governmentChoose,
                labelTxt: "government*",
                itemDataList: governmentDataList,
                onDropDownItemSelected: _onDropDownItemSelectedGovernment,
                isValidationInProgress: _validationInProgress,
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonDropDownField(
                  validator: (value) {
                    setState(() {
                      _validationInProgress = value ==
                          null; // Set to true if value is null (validation in progress)
                    });
                    if (value == null) {
                      return 'Please select a region';
                    }
                    return null; // Return null when the selection is valid
                  },
                  itemChoose: _regionChoose,
                  labelTxt: "region*",
                  itemDataList: regionDataList,
                  onDropDownItemSelected: _onDropDownItemSelectedRegion,
                  isValidationInProgress: _validationInProgress),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonInputField(
                  label: 'Address*',
                  textType: TextInputType.streetAddress,
                  controller: _addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter address';
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
                      return 'please, Enter contact number';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
            ],
          ),
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
        content: Form(
          key: _step2Key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonInputField(
                  label: 'License number*',
                  photoHight: MediaQuery.of(context).size.height / 16,
                  textType: TextInputType.phone,
                  controller: _licensenumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter license number ';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonInputField(
                  isCustomIcon: true,
                  suffixIconPth: "assets/icons/filled.svg",
                  label: 'Commercial register*',
                  photoHight: MediaQuery.of(context).size.height / 16,
                  textType: TextInputType.phone,
                  controller: _commercialController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter commercial register ';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonInputField(
                  isCustomIcon: true,
                  suffixIconPth: "assets/icons/filled.svg",
                  label: 'Pharmacy photo*',
                  photoHight: MediaQuery.of(context).size.height / 16,
                  textType: TextInputType.text,
                  controller: _pharmacyPhotoController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter pharmacy photo';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
            ],
          ),
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
        content: Form(
          key: _step3Key,
          child: Column(
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
                  label: 'Email(optional)',
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
        content: Form(
          key: _step4Key,
          child: Column(
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
                      return 'please, Enter password';
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
        ),
        isActive: _current_step >= 3,
        state: _current_step <= 3 ? StepState.indexed : StepState.complete,
      )
    ];
  }

  onStepContinue() {
    if (_current_step == 0) {
      if (_step1Key.currentState!.validate()) {
        // Proceed to the next step
        setState(() {
          _current_step++;
        });
      }
    } else if (_current_step == 1) {
      if (_step2Key.currentState!.validate()) {
        // Proceed to the next step
        setState(() {
          _current_step++;
        });
      }
    } else if (_current_step == 2) {
      if (_step3Key.currentState!.validate()) {
        // Proceed to the next step
        setState(() {
          _current_step++;
        });
      }
    } else if (_current_step == 3) {
      if (_step4Key.currentState!.validate()) {
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
        // Proceed to the next step
      }
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

class GovernmentListDataModel {
  String government_name;
  String government_logo_path;
  GovernmentListDataModel(this.government_name, this.government_logo_path);
}

class RegionListDataModel {
  String region_name;
  String region_logo_path;
  RegionListDataModel(this.region_name, this.region_logo_path);
}
