import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_state.dart';


class CartScreenCubit extends Cubit<CartScreenStates> {
  CartScreenCubit() : super(CartScreenInitialState());
}
