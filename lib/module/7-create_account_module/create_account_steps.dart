import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/model/create_account_model/dropdown_model.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constrants.dart';
import '../../shared/styles/colors.dart';

List<Step> getSteps({
  required BuildContext context,
  required GlobalKey<FormState> step1Key,
  required GlobalKey<FormState> step2Key,
  required GlobalKey<FormState> step3Key,
  required GlobalKey<FormState> step4Key,
  required TextEditingController nameController,
  required TextEditingController addressController,
  required TextEditingController contactNumberController,
  required TextEditingController pharmacyLicenseNumberController,
  required TextEditingController pharmacistLicenseNumberController,
  required TextEditingController commercialController,
required selectPharmacyPhoto,
  required selectCommercialPhoto,


  required pathCommercial,
  required pathPharmaPhoto,
  required TextEditingController pharmacyPhotoController,
  required TextEditingController firstnameController,
  required TextEditingController lastnameController,
  required TextEditingController emailController,
  required TextEditingController phoneNumberController,
  required TextEditingController usernameController,
  required TextEditingController passwordController,
  required dynamic countryChoose,
  required dynamic governmentChoose,
  required dynamic regionChoose,
  required List<ListDataModel> countryDataList,
  required List<ListDataModel> governmentDataList,
  required List<ListDataModel> regionDataList,
  required Function(ListDataModel) onDropDownItemSelectedCountry,
  required Function(ListDataModel) onDropDownItemSelectedGovernment,
  required Function(ListDataModel) onDropDownItemSelectedRegion,
  required bool uploadCommercialPhoto,
  required bool uploadPharmacyPhoto,
  required int currentStep,
  required Function setState,
}) {
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
        key: step1Key,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'Name*',
                textType: TextInputType.text,
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter Name';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonDropDownField(

              validator: (value) {

                if (value == null) {
                  return 'Please select a country';
                }
                return null; // Return null when the selection is valid
              },
              itemChoose: countryChoose,
              labelTxt: "Country*",
              itemDataList: countryDataList,
              onDropDownItemSelected: onDropDownItemSelectedCountry,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonDropDownField(
              validator: (value) {

                if (value == null) {
                  return 'Please select a government';
                }
                return null; // Return null when the selection is valid
              },
              itemChoose: governmentChoose,
              labelTxt: "government*",
              itemDataList: governmentDataList,
              onDropDownItemSelected: onDropDownItemSelectedGovernment,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonDropDownField(
                validator: (value) {

                  if (value == null) {
                    return 'Please select a region';
                  }
                  return null; // Return null when the selection is valid
                },
                itemChoose: regionChoose,
                labelTxt: "region*",
                itemDataList: regionDataList,
                onDropDownItemSelected: onDropDownItemSelectedRegion,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Address*',
                textType: TextInputType.streetAddress,
                controller: addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter address';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Contact number*',
                textType: TextInputType.phone,
                controller: contactNumberController,
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
        key: step2Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'Pharmacy’s license number*',
                photoHeight: MediaQuery.of(context).size.height / 16,
                textType: TextInputType.phone,
                controller: pharmacyLicenseNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter license number ';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Pharmacist\'s license number*',
                photoHeight: MediaQuery.of(context).size.height / 16,
                textType: TextInputType.phone,
                controller: pharmacistLicenseNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter license number ';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
              isCustomIcon: uploadCommercialPhoto,
              isReadOnly: true,
              photoHeight: 55.0,
              controller: commercialController,

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
              suffixPressed: selectCommercialPhoto
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField
              (
              isCustomIcon: uploadPharmacyPhoto,
              isReadOnly: true,
              photoHeight: 55.0,
              controller: pharmacyPhotoController,
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
              suffixPressed: selectPharmacyPhoto,
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
        key: step3Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'First name*',
                textType: TextInputType.text,
                controller: firstnameController,
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
                controller: lastnameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter phone number';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                label: 'Email*',
                textType: TextInputType.emailAddress,
                controller: emailController,
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
                controller: phoneNumberController,
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
        key: step4Key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonInputField(
                label: 'Username',
                textType: TextInputType.text,
                controller: usernameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please, Enter username';
                  }
                  return null;
                }),
            SizedBox(height: MediaQuery.of(context).size.height / 42.835),
            commonInputField(
                isPassword: true,
                suffixIconData: Icons.visibility_off_outlined,
                label: 'Password*',
                textType: TextInputType.visiblePassword,
                controller: passwordController,
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
                Padding(
                  padding: const EdgeInsets.only(top: 2.0, right: 8.0),
                  child: Checkbox(
                      side: const BorderSide(
                          width: 1.3, color: Colors.grey, strokeAlign: 1),
                      onChanged: (value) => setState(() {
                        isReadPolicies = value!;
                      }), value: isReadPolicies,),
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
