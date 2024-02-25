import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/5-login_module/login_screen.dart';
import '../../model/create_account_model/dropdown_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constrants.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/custom_checkbox.dart';

import 'package:path/path.dart' as path; // Import the path package


class CreateAccountScreen extends StatefulWidget {
  static const String routeName = 'CreateAccountScreenRoute';
  const CreateAccountScreen({super.key});
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CreateAccountScreen(),
    );
  }

  @override
  State<CreateAccountScreen> createState() => _ResetViaSmsScreenState();
}

class _ResetViaSmsScreenState extends State<CreateAccountScreen> {
  final _nameController = TextEditingController();

  final _contactNumberController = TextEditingController();
  final _contactNumberController2 = TextEditingController();
  final _contactNumberController3 = TextEditingController();

  final _addressController = TextEditingController();
  final _commercialController = TextEditingController();
  final _pharmacyPhotoController = TextEditingController();
  final _licenseNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  String ?pathCommercial;
  String ?pathPharmaPhoto;

  int currentStep = 0;

  ListDataModel? _countryChoose;
  ListDataModel? _governmentChoose;
  ListDataModel? _regionChoose;

  bool isCustomIcon1=true;
  bool isCustomIcon2=true;


  @override
  void initState() {
    super.initState();
    _countryChoose = null;
    _governmentChoose = null;
    _regionChoose = null;
    countVisibleWidgets = 1;
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

  void _onDropDownItemSelectedRegion(ListDataModel newSelectedRegion) {
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
  bool _displayNewTextField2 = false;
  bool _displayNewTextField3 = false;
  int countVisibleWidgets = 1;


  void toggleNewTextFieldVisibilityAdd() {
    setState(() {
      if (countVisibleWidgets == 1) {
        _displayNewTextField2 = true; // Display the second input field
        countVisibleWidgets++;
      } else if (countVisibleWidgets == 2) {
// Display the third input field
        _displayNewTextField3 = true;
        countVisibleWidgets++;
      }
    });
  }
  void toggleNewTextFieldVisibilityRemove() {
    setState(() {
      if (countVisibleWidgets == 3) {
// Hide the third input field
        _displayNewTextField3 = false;

        countVisibleWidgets--;
      } else if (countVisibleWidgets == 2) {
        _displayNewTextField2 = false; // Hide the second input field
        countVisibleWidgets--;
      }
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
                  bool hasValue = false;

                  // Check if any field in the stepper has a non-null value
                  if (currentStep <= 3) {
                    // Check for fields in step 1
                    if (_nameController.text.isNotEmpty ||
                        _addressController.text.isNotEmpty ||
                        _contactNumberController.text.isNotEmpty ||
                        _contactNumberController2.text.isNotEmpty ||
                        _countryChoose != null ||
                        _governmentChoose != null ||
                        _regionChoose != null) {
                      hasValue = true;
                    }

                    // Check for fields in step 2
                    if (_licenseNumberController.text.isNotEmpty ||
                        _commercialController.text.isNotEmpty ||
                        _pharmacyPhotoController.text.isNotEmpty) {
                      hasValue = true;
                    }

                    // Check for fields in step 3
                    if (_firstnameController.text.isNotEmpty ||
                        _lastnameController.text.isNotEmpty ||
                        _emailController.text.isNotEmpty ||
                        _phoneNumberController.text.isNotEmpty) {
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
                          contentPadding: const EdgeInsets.all(24.0),
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
                            const SizedBox(width: 31),
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
            // connectorThickness: currentStep?2:0,
            connectorThickness: 0,
            //Todo :i want to make  connectorThickness=0 when current opened else make it 2

            margin: const EdgeInsets.all(20),
            currentStep: currentStep,
            steps: getSteps(),
            controlsBuilder: (context, _) {
              if (currentStep == 0) {
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
              } else if (currentStep == 3) {
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
                  suffixPressed: () {
                    toggleNewTextFieldVisibilityAdd();
                  },
                  isCustomIcon: true,
                  photoHeight: MediaQuery.of(context).size.height / 16,
                  suffixIconPth: "assets/icons/Group 61.svg",
                  label: 'Contact number*',
                  textType: TextInputType.phone,
                  controller: _contactNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter contact number';
                    }
                    return null;
                  }),
              Visibility(
                  visible: _displayNewTextField2,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 42.835)),
              Visibility(
                visible: _displayNewTextField2,
                child: commonInputField(
                    suffixPressed: () {
                      // Todo:create new contact number field  with common input field when call this function  to add new contact number maximum common fields are 3
                      toggleNewTextFieldVisibilityRemove();
                    },
                    isCustomIcon: true,
                    photoHeight: MediaQuery.of(context).size.height / 16,
                    suffixIconPth: "assets/icons/Group 62.svg",
                    label: 'Contact number*',
                    textType: TextInputType.phone,
                    controller: _contactNumberController2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter another contact number';
                      }
                      return null;
                    }),
              ),
              Visibility(
                  visible: _displayNewTextField3,
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 42.835)),
              Visibility(
                visible: _displayNewTextField3,
                child: commonInputField(
                    suffixPressed: () {
                      // Todo:create new contact number field  with common input field when call this function  to add new contact number maximum common fields are 3
                      toggleNewTextFieldVisibilityRemove();
                    },
                    isCustomIcon: true,
                    photoHeight: MediaQuery.of(context).size.height / 16,
                    suffixIconPth: "assets/icons/Group 62.svg",
                    label: 'Contact number*',
                    textType: TextInputType.phone,
                    controller: _contactNumberController3,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please, Enter another contact number';
                      }
                      return null;
                    }),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
            ],
          ),
        ),
        isActive: currentStep >= 0,
        state: currentStep <= 0 ? StepState.indexed : StepState.complete,
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
                  photoHeight: MediaQuery.of(context).size.height / 16,
                  textType: TextInputType.phone,
                  controller: _licenseNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter license number ';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonInputField(
                isCustomIcon: isCustomIcon1,
                isReadOnly: true,
                photoHeight: 55.0,
                controller: _commercialController,
                validator: (value) {

                  if (value!.isEmpty) {
                    return 'please, Commercial Register*';
                  }
                  return null;
                },
                suffixIconPth: "assets/icons/filled.svg",
                suffixIconData: Icons.delete_sharp,
                suffixIconCol: error,
                label: "Commercial Register*",
                suffixPressed: () async {
                  // Toggle between different functions and icons
                  if (isCustomIcon1) {
                    // Function for custom icon
                    try {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        setState(() {
                          pathCommercial = result.files.single.path!;
                          _commercialController.text = path.basename(pathCommercial!);
                          isCustomIcon1 = !isCustomIcon1;
                        });
                        print('Selected PDF path: $pathCommercial');
                      } else {
                        print('User canceled the file picker');
                      }
                    } catch (e) {
                      print('Error while picking the file: $e');
                    }
                  } else {
                    // Function for regular icon
                    setState(() {
                      _commercialController.clear();
                      isCustomIcon1 = !isCustomIcon1;
                    });
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonInputField
                (
                isCustomIcon: isCustomIcon2,
                isReadOnly: true,
                photoHeight: 55.0,
                controller: _pharmacyPhotoController,
                validator: (value) {

                  if (value!.isEmpty) {
                    return 'please, Enter Pharmacy Photo*';
                  }
                  return null;
                },
                suffixIconPth: "assets/icons/filled.svg",
                suffixIconData: Icons.delete_rounded,
                suffixIconCol:error,
                label: "Pharmacy Photo*",
                suffixPressed: () async {
                  // Toggle between different functions and icons
                  if (isCustomIcon2) {
                    // Function for custom icon
                    try {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf'],
                      );

                      if (result != null) {
                        setState(() {
                          pathPharmaPhoto = result.files.single.path!;
                          _pharmacyPhotoController.text = path.basename(pathPharmaPhoto!);
                          isCustomIcon2 = !isCustomIcon2;
                        });
                        print('Selected PDF path: $pathPharmaPhoto');
                      } else {
                        print('User canceled the file picker');
                      }
                    } catch (e) {
                      print('Error while picking the file: $e');
                    }
                  } else {
                    // Function for regular icon
                    setState(() {
                      _pharmacyPhotoController.clear();
                      isCustomIcon2 = !isCustomIcon2;
                    });
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 21.4175),
            ],
          ),
        ),
        isActive: currentStep >= 1,
        state: currentStep <= 1 ? StepState.indexed : StepState.complete,
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
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please, Enter email';
                    }
                    return null;
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 42.835),
              commonInputField(
                  label: 'Phone number*',
                  textType: TextInputType.phone,
                  controller: _phoneNumberController,
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
        isActive: currentStep >= 2,
        state: currentStep <= 2 ? StepState.indexed : StepState.complete,
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
        isActive: currentStep >= 3,
        state: currentStep <= 3 ? StepState.indexed : StepState.complete,
      )
    ];
  }

  onStepContinue() {
    if (currentStep == 0) {
      if (_step1Key.currentState!.validate()) {
        // Proceed to the next step
        setState(() {
          currentStep++;
        });
      }
    } else if (currentStep == 1) {
      if (_step2Key.currentState!.validate()) {
        // Proceed to the next step
        setState(() {
          currentStep++;
        });
      }
    } else if (currentStep == 2) {
      if (_step3Key.currentState!.validate()) {
        // Proceed to the next step
        setState(() {
          currentStep++;
        });
      }
    } else if (currentStep == 3) {
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
    if (currentStep > 0) {
      setState(() {
        currentStep -= 1;
      });
    }
  } //to cancel and close the opened list and move the previous step
}
