import 'package:file_picker/file_picker.dart';

class UserRegistrationModel {
  final String pharmacyName;
  final String countryOfPharmacy;
  final String governmentOfPharmacy;
  final String regionOfPharmacy;
  final String addressOfPharmacy;
  final String pharmacyContactNumber;
  final String pharmacyLicenseNumber;
  final String pharmacistLicenseNumber;
  final FilePickerResult? pharmacyCommercialRegisterPhoto;
  final FilePickerResult? pharmacyPhoto;
  final String pharmcistFirstName;
  final String pharmacistLastName;
  final String pharmacistEmail;
  final String pharmacistPhoneNumber;
  final String userName;
  final String pharmacistPassword;

  UserRegistrationModel({
    required this.pharmacyName,
    required this.countryOfPharmacy,
    required this.governmentOfPharmacy,
    required this.regionOfPharmacy,
    required this.addressOfPharmacy,
    required this.pharmacyContactNumber,
    required this.pharmacyLicenseNumber,
    required this.pharmacistLicenseNumber,

    required this.pharmacyCommercialRegisterPhoto,
    required this.pharmacyPhoto,
    required this.pharmcistFirstName,
    required this.pharmacistLastName,
    required this.pharmacistEmail,
    required this.pharmacistPhoneNumber,
    required this.userName,
    required this.pharmacistPassword,
  });


}
