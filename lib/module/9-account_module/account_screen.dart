import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Blocs/home_cubit/home_cubit.dart';
import '../../shared/Blocs/home_cubit/home_state.dart';


class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: BlocBuilder<HomeScreenCubit, HomeScreenStates>(
        builder: (context, state) {
          // Your HomeScreen UI goes here
          return const Center(
            child: Text('Account Screen'),
          );
        },
      ),
    );
  }
}
