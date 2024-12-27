import 'package:classassignment2/cubit/areaofcircle_cubit.dart';
import 'package:classassignment2/cubit/simple_interest_cubit.dart';
import 'package:classassignment2/view/areaofcircle_cubit_view.dart';
import 'package:classassignment2/view/simple_interest_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(
    this._simpleinterestCubit,
    this._areaofcircleCubit,
  ) : super(null);

  final SimpleInterestCubit _simpleinterestCubit;
  final AreaOfCircleCubit _areaofcircleCubit;

  void openSimpleInterestView(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _simpleinterestCubit,
          child: SimpleInterestView()),
      ),
    );
  }
  void openAreaofCircleView(BuildContext context){
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: _areaofcircleCubit,
          child: AreaOfCircleView()),
      ),
    );
  }
  
}