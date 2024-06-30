import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_state.dart';

class AccountScreenCubit extends Cubit<AccountScreenStates> {
  AccountScreenCubit() : super(AccountScreenInitialState());
}
