import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/bloc_observer.dart';
import 'package:pharma_store/shared/networks/local/router/app_router.dart';
import 'package:pharma_store/shared/networks/remote/helper/dio_helper.dart';
import 'package:pharma_store/shared/styles/colors.dart';

import 'module/1-splash_module/splash_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const PharmaStore());
}

class PharmaStore extends StatelessWidget {
  const PharmaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: HexColor(primaryColor)),
              useMaterial3: true,
            ),
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          );
        });
  }
}
