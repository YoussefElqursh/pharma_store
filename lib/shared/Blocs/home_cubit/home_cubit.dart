import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
}
