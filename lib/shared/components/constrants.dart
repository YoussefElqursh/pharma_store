import '../../model/onboarding_model/onboarding_model.dart';
//-----------------------------Strings----------------------------------------//

String appName = 'Pharma Store';

String getStartedImage = "assets/images/onBoarding_img.svg";
String getStartedHeadText = "Get Started";
String getStartedBodyText = "Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.";

//-----------------------------Lists----------------------------------------//

// this is lis use to make different data in OnBoarding page view.
List<OnBoardingModel> boardingList =
[
  OnBoardingModel(
      image: 'assets/images/onBoarding_img.svg',
      headText: 'Search for Drugs',
      subText: 'Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.'
  ),
  OnBoardingModel(
      image: 'assets/images/onBoarding_img.svg',
      headText: 'Order Drugs',
      subText: 'Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.'
  ),
  OnBoardingModel(
      image: 'assets/images/onBoarding_img.svg',
      headText: 'Receive Drugs',
      subText: 'Your financial security is our top priority.Link bank accounts and credit cards for safe, hassle-free payments.'
  ),
];