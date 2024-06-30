import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/Blocs/cart_cubit/cart_cubit.dart';
import '../../shared/Blocs/cart_cubit/cart_state.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartScreenCubit(),
      child: BlocBuilder<CartScreenCubit, CartScreenStates>(
        builder: (context, state) {
          // Your HomeScreen UI goes here
          return const Center(
            child: Text('Cart Screen'),
          );
        },
      ),
    );
  }
}
