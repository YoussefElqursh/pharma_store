import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:pharma_store/shared/networks/end_points.dart';

import '../../../module/7-create_account_module/create_account_data_model.dart';

part 'create_account_state.dart';

class CreateAccountCubit extends Cubit<CreateAccountState> {
  CreateAccountCubit() : super(CreateAccountInitialState());

  static CreateAccountCubit get(context) => BlocProvider.of(context);

  Future<void> createAccount(UserRegistrationModel user) async {
    emit(CreateAccountLoadingState());

    final url = Uri.parse(baseUrl + createAccountRoute);

    print('Request URL: $url'); // Log the URL

    var request = http.MultipartRequest('POST', url);

    // Add text fields
    request.fields['pharmacyName'] = user.pharmacyName;
    request.fields['country'] = user.countryOfPharmacy;
    request.fields['governorate'] = user.governmentOfPharmacy;
    request.fields['region'] = user.regionOfPharmacy;
    request.fields['address'] = user.addressOfPharmacy;
    request.fields['contactNumber'] = user.pharmacyContactNumber;
    request.fields['licenseNumber'] = user.pharmacyLicenseNumber;
    request.fields['pharmacist[licenseNumber]'] = user.pharmacyLicenseNumber;
    request.fields['pharmacist[firstName]'] = user.pharmcistFirstName;
    request.fields['pharmacist[lastName]'] = user.pharmacistLastName;
    request.fields['pharmacist[email]'] = user.pharmacistEmail;
    request.fields['pharmacist[phoneNumber]'] = user.pharmacistPhoneNumber;
    request.fields['userName'] = user.userName;
    request.fields['password'] = user.pharmacistPassword;

    // Add file fields
    if (user.pharmacyCommercialRegisterPhoto!.files.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'commercialRegister', user.pharmacyCommercialRegisterPhoto!.files.first.path!));
    }
    if (user.pharmacyPhoto!.files.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
          'pharmacyPhoto', user.pharmacyPhoto!.files.first.path!));
    }

    print('Request fields: ${request.fields}'); // Log the fields
    print('Request files: ${request.files.map((file) => file.filename)}'); // Log the file names

    // Send the request
    final response = await request.send();

    print('Response status: ${response.statusCode}'); // Log the status code
    final responseBody = await response.stream.bytesToString();
    print('Response body: $responseBody'); // Log the response body

    if (response.statusCode == 201) {
      emit(CreateAccountSuccessState());
    } else {
      emit(CreateAccountErrorState(message: 'Failed to create account: $responseBody'));
    }
  }
}
