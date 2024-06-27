import 'dropdown_model.dart';

class GovernmentListDataModel {
  String governmentName;
  String governmentLogoPath;
  GovernmentListDataModel(this.governmentName, this.governmentLogoPath);
}
List<ListDataModel> governmentDataList = [
  ListDataModel(
      infoName: 'Alexandria'),
  ListDataModel(
      infoName: 'Tanta')
];
