import 'package:classassignment2/cubit/areaofcircle_cubit.dart';
import 'package:classassignment2/cubit/arithmetic_cubit.dart';
import 'package:classassignment2/cubit/dashboard_cubit.dart';
import 'package:classassignment2/cubit/simple_interest_cubit.dart';
import 'package:classassignment2/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SimpleInterestCubit()),
        BlocProvider(create: (context) => AreaOfCircleCubit()),
        BlocProvider(create: (context) => ArithmeticCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<SimpleInterestCubit>(),
            context.read<AreaOfCircleCubit>(),
            context.read<ArithmeticCubit>(),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'Flutter BLoC',
        debugShowCheckedModeBanner: false,
        home: DashboardView(),
      ),
    );
  }
}
