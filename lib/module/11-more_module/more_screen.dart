import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Blocs/more_cubit/more_cubit.dart';
import '../../shared/Blocs/more_cubit/more_state.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoreScreenCubit(),
      child: BlocBuilder<MoreScreenCubit, MoreScreenStates>(
        builder: (context, state) {
          // Your HomeScreen UI goes here
          return const Center(
            child: Text('More Screen'),
          );
        },
      ),
    );
  }
}
