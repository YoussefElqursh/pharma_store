class ListDataModel {
  final String infoName;
  final String ?infoLogoPath;


  ListDataModel({
    required this.infoName,
     this.infoLogoPath,
  });

  get infPhotoPath {
    return infoLogoPath;
  }
  get infName {
    return infoName;
  }


}
