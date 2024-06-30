import 'package:flutter_bloc/flutter_bloc.dart';

import 'more_state.dart';

class MoreScreenCubit extends Cubit<MoreScreenStates> {
  MoreScreenCubit() : super(MoreScreenInitialState());
}
