import 'dropdown_model.dart';

class CountryListDataModel {
  String countryName;
  String countryLogoPath;
  CountryListDataModel(this.countryName, this.countryLogoPath);
}
List<ListDataModel> countryDataList = [
  ListDataModel(
      infoName: 'Egypt',
      infoLogoPath: "assets/icons/Password-field.svg"),
  ListDataModel(
      infoName: 'Tunisia',
      infoLogoPath: "assets/icons/TN.svg"),
];
