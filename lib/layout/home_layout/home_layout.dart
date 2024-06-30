import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pharma_store/shared/Blocs/home_layout_cubit.dart';

import '../../shared/Blocs/home_layout_state.dart';
import '../../widgets/home_widgets/custom_nav_bar.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'HomeLayoutRoute';

  const HomeLayout({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const HomeLayout(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeLayoutCubit(),
      child: BlocBuilder<HomeLayoutCubit, HomeLayoutState>(
        builder: (context, state) {
          HomeLayoutCubit cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              unselectedItemColor: HexColor("#AAAAAA"),
              selectedItemColor: HexColor("#4A72FF"),
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: CustomNavBarIcon(
                    iconPath: 'assets/icons/homeIcon.svg',
                    isSelected: cubit.currentIndex == 0,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: CustomNavBarIcon(
                    iconPath: 'assets/icons/accountIcon.svg',
                    isSelected: cubit.currentIndex == 1,
                  ),
                  label: "Account",
                ),
                BottomNavigationBarItem(
                  icon: CustomNavBarIcon(
                    iconPath: 'assets/icons/cartIcon.svg',
                    isSelected: cubit.currentIndex == 2,
                  ),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  icon: CustomNavBarIcon(
                    iconPath: 'assets/icons/moreIcon.svg',
                    isSelected: cubit.currentIndex == 3,
                  ),
                  label: "More",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
