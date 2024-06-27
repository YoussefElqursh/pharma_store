part of 'create_account_cubit.dart';

@immutable
sealed class CreateAccountState {}

final class CreateAccountInitialState extends CreateAccountState {}

final class CreateAccountLoadingState extends CreateAccountState {}

final class CreateAccountSuccessState extends CreateAccountState {}

final class CreateAccountErrorState extends CreateAccountState {
  final String message;

  CreateAccountErrorState({required this.message});
}
