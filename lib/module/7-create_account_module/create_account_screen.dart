import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/module/5-login_module/login_screen.dart';
import '../../model/create_account_model/countrylist_model.dart';
import '../../model/create_account_model/dropdown_model.dart';
import '../../model/create_account_model/governmentlist_model.dart';
import '../../model/create_account_model/regionlist_model.dart';
import '../../shared/Blocs/create_account_cubit/create_account_cubit.dart';
import '../../shared/components/components.dart';
import '../../shared/components/constrants.dart';
import '../../shared/components/functions.dart';
import '../../shared/styles/colors.dart';
import 'package:path/path.dart' as path; // Import the path package

import 'create_account_data_model.dart';
import 'create_account_steps.dart'; // Import the path package

// Import the path package

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = 'CreateAccountScreenRoute';
  const CreateAccountScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => BlocProvider(
        create: (BuildContext context) => CreateAccountCubit(),
        child: const CreateAccountScreen(),
      ),
    );
  }

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {
//--------------------------------------------------------------------------------------//
  final _nameController = TextEditingController();

  final _contactNumberController = TextEditingController();
  final _addressController = TextEditingController();
  final _commercialController = TextEditingController();
  final _pharmacyPhotoController = TextEditingController();
  final _pharmacistLicenseNumberController = TextEditingController();
  final _pharmacyLicenseNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
//--------------------------------------------------------------------------------------//
  FilePickerResult? commercialPhoto;
  FilePickerResult? pharmacyPhoto;
  String? pathCommercial;
  String? pathPharmaPhoto;
//--------------------------------------------------------------------------------------//
  int currentStep = 0;
//--------------------------------------------------------------------------------------//
  ListDataModel? _countryChoose;
  ListDataModel? _governmentChoose;
  ListDataModel? _regionChoose;
//--------------------------------------------------------------------------------------//
  bool uploadCommercialPhoto = true;
  bool uploadPharmacyPhoto = true;
//--------------------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    _countryChoose = null;
    _governmentChoose = null;
    _regionChoose = null;
  }

  final GlobalKey<FormState> _step1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _step2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _step3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _step4Key = GlobalKey<FormState>();
//--------------------------------------------------------------------------------------//
  void selectPhoto() async {
    {
      // Toggle between different functions and icons
      if (uploadPharmacyPhoto) {
        // Function for custom icon
        try {
          pharmacyPhoto = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['jpg', 'png'],
          );

          if (pharmacyPhoto != null) {
            setState(() {
              pathPharmaPhoto = pharmacyPhoto?.files.single.path!;
              _pharmacyPhotoController.text = path.basename(pathPharmaPhoto!);
              uploadPharmacyPhoto = !uploadPharmacyPhoto;
            });
          }
        } catch (e) {
          print('Error while picking the file: $e');
        }
      } else {
        // Function for regular icon
        setState(() {
          _pharmacyPhotoController.clear();
          uploadPharmacyPhoto = !uploadPharmacyPhoto;
        });
      }
    }
  }

  void selectCommercialPhoto() async {
    // Toggle between different functions and icons
    if (uploadCommercialPhoto) {
      // Function for custom icon
      try {
        commercialPhoto = (await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['jpg', 'png'],
        ))!;

        setState(() {
          pathCommercial = commercialPhoto?.files.single.path!;
          _commercialController.text = path.basename(pathCommercial!);
          uploadCommercialPhoto = !uploadCommercialPhoto;
        });
        print('Selected photo path: $pathCommercial');
      } catch (e) {
        print('Error while picking the file: $e');
      }
    } else {
      // Function for regular icon
      setState(() {
        _commercialController.clear();
        uploadCommercialPhoto = !uploadCommercialPhoto;
      });
    }
  }
//--------------------------------------------------------------------------------------//

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
                          _countryChoose != null ||
                          _governmentChoose != null ||
                          _regionChoose != null) {
                        hasValue = true;
                      }

                      // Check for fields in step 2
                      if (_pharmacistLicenseNumberController.text.isNotEmpty ||
                          _commercialController.text.isNotEmpty ||
                          _pharmacyPhotoController.text.isNotEmpty ||
                          _pharmacyLicenseNumberController.text.isNotEmpty) {
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
                      if (_passwordController.text.isNotEmpty ||
                          _usernameController.text.isNotEmpty) {
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
        body: BlocListener<CreateAccountCubit, CreateAccountState>(
          listener: (context, state) {
            if (state is CreateAccountLoadingState) {
              // Show loading indicator
              // e.g., show a loading dialog or snackbar
            } else if (state is CreateAccountSuccessState) {
              // Handle success state
              // e.g., show a success message and navigate to another screen
            } else if (state is CreateAccountErrorState) {
              // Handle error state
              // e.g., show an error message
            }
          },
          child: BlocBuilder<CreateAccountCubit, CreateAccountState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 220),
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
                        controller: ScrollController(),
                        margin: const EdgeInsets.all(20),
                        currentStep: currentStep,
                        steps: getSteps(
                          context: context,
                          step1Key: _step1Key,
                          step2Key: _step2Key,
                          step3Key: _step3Key,
                          step4Key: _step4Key,
                          nameController: _nameController,
                          addressController: _addressController,
                          contactNumberController: _contactNumberController,
                          pharmacyLicenseNumberController:
                              _pharmacyLicenseNumberController,
                          pharmacistLicenseNumberController:
                              _pharmacistLicenseNumberController,
                          commercialController: _commercialController,
                          pathCommercial: pathCommercial,
                          pathPharmaPhoto: pathPharmaPhoto,
                          pharmacyPhotoController: _pharmacyPhotoController,
                          firstnameController: _firstnameController,
                          lastnameController: _lastnameController,
                          emailController: _emailController,
                          phoneNumberController: _phoneNumberController,
                          usernameController: _usernameController,
                          passwordController: _passwordController,
                          countryChoose: _countryChoose,
                          governmentChoose: _governmentChoose,
                          regionChoose: _regionChoose,
                          countryDataList: countryDataList,
                          governmentDataList: governmentDataList,
                          regionDataList: regionDataList,
                          onDropDownItemSelectedCountry:
                              _onDropDownItemSelectedCountry,
                          onDropDownItemSelectedGovernment:
                              _onDropDownItemSelectedGovernment,
                          onDropDownItemSelectedRegion:
                              _onDropDownItemSelectedRegion,
                          uploadCommercialPhoto: uploadCommercialPhoto,
                          uploadPharmacyPhoto: uploadPharmacyPhoto,
                          currentStep: currentStep,
                          setState: setState,
                          selectPharmacyPhoto: selectPhoto,
                          selectCommercialPhoto: selectCommercialPhoto,
                        ),
                        controlsBuilder: (context, _) {
                          if (currentStep == 0) {
                            return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15.09),
                                  commonMaterialBtn(
                                      width: MediaQuery.of(context).size.width /
                                          2.44,
                                      label: 'Next',
                                      photoPath: 'assets/icons/arrow-right.svg',
                                      txtBtnColor: white100,
                                      function: () => onStepContinue(),
                                      containerColor: primaryColor,
                                      borderColor: primaryColor,
                                      hasIcon: true)
                                ]);
                          } else if (currentStep == 3) {
                            return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  commonMaterialBtn(
                                      hasIcon: true,
                                      swapIcon: true,
                                      containerColor: white100,
                                      width: MediaQuery.of(context).size.width /
                                          2.44,
                                      label: 'Previous',
                                      photoPath: 'assets/icons/back_arrow.svg',
                                      txtBtnColor: primaryColor,
                                      function: () => onStepCancel(),
                                      borderColor: primaryColor),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15.09),
                                  commonMaterialBtn(
                                      width: MediaQuery.of(context).size.width /
                                          2.44,
                                      label: 'Create',
                                      photoPath: 'assets/icons/arrow-right.svg',
                                      txtBtnColor: white100,
                                      function: () => onStepContinue(),
                                      containerColor: primaryColor,
                                      borderColor: primaryColor,
                                      hasIcon: false)
                                ]);
                          } else {
                            return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  commonMaterialBtn(
                                      hasIcon: true,
                                      swapIcon: true,
                                      containerColor: white100,
                                      width: MediaQuery.of(context).size.width /
                                          2.44,
                                      label: 'Previous',
                                      photoPath: 'assets/icons/back_arrow.svg',
                                      txtBtnColor: primaryColor,
                                      function: () => onStepCancel(),
                                      borderColor: primaryColor),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          15.09),
                                  commonMaterialBtn(
                                      width: MediaQuery.of(context).size.width /
                                          2.44,
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
              );
            },
          ),
        ));
  }

//--------------------------------------------------------------------------------------//
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
      if (_step4Key.currentState!.validate() && isReadPolicies) {
        UserRegistrationModel userRegistrationModel = UserRegistrationModel(
          pharmacyName: _nameController.text,
          pharmacyContactNumber: _contactNumberController.text,
          addressOfPharmacy: _addressController.text,
          pharmacyLicenseNumber: _pharmacyLicenseNumberController.text,
          pharmacyPhoto: pharmacyPhoto, //null
          pharmacistEmail: _emailController.text,
          userName: _usernameController.text,
          pharmacistPassword: _passwordController.text,
          pharmcistFirstName: _firstnameController.text,
          pharmacistLastName: _lastnameController.text,
          pharmacistPhoneNumber: _phoneNumberController.text,
          countryOfPharmacy: _countryChoose!.infoName,
          governmentOfPharmacy: _governmentChoose!.infoName,
          regionOfPharmacy: _regionChoose!.infoName,
          pharmacyCommercialRegisterPhoto: commercialPhoto //null
          ,
          pharmacistLicenseNumber: _pharmacistLicenseNumberController.text,
        );

        CreateAccountCubit.get(context).createAccount(userRegistrationModel);

        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Form Submitted"),
                content:
                    const Text("Your form has been submitted successfully"),
                actions: [
                  TextButton(
                      // onPressed: () => print("hello"),
                      onPressed: () async {
                        // Store the cubit instance before the async operation
                    //Todo: navigate to the home page
                        print("start registration");
                      },
                      child: const Text("OK"))
                ],
              );
            });
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

//--------------------------------------------------------------------------------------//
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
//--------------------------------------------------------------------------------------//
}
