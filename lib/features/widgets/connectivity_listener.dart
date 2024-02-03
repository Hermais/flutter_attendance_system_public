import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/cubits/internet_cubit.dart';

class ConnectivityListener extends StatelessWidget {
  final Widget child;

  const ConnectivityListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetDisconnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 3),
              content: Text('Internet Connection is lost, please check your connection!'),
            ),
          );
        }else if (state is InternetConnected) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Theme.of(context).primaryColor,
              content: const Text('Internet Connection is restored!'),
            ),
          );
        }
      },
      child: child,
    );
  }
}
