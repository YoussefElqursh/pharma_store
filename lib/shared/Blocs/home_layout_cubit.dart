import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../module/10-cart_module/cart_screen.dart';
import '../../module/11-more_module/more_screen.dart';
import '../../module/8-home_module/home_screen.dart';
import '../../module/9-account_module/account_screen.dart';
import 'home_layout_state.dart';


class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeLayoutStateInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const AccountScreen(),
    const CartScreen(),
    const MoreScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    switch (index) {
      case 0:
        emit(HomeBottomNavState());
        break;
      case 1:
        emit(AccountBottomNavState());
        break;
      case 2:
        emit(CartBottomNavState());
        break;
      case 3:
        emit(MoreBottomNavState());
        break;
      default:
        break;
    }
  }
}
