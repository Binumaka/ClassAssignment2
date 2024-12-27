import 'package:classassignment2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestView extends StatelessWidget {
  const SimpleInterestView({super.key});

  @override
  Widget build(BuildContext context) {
    final principalController = TextEditingController();
    final rateController = TextEditingController();
    final timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Binu Simple Interest Cubit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: principalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Principal', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Rate of Interest',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Time', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, result) {
                  return Text(
                    'Result: ${result.toStringAsFixed(2)}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final principal =
                        double.tryParse(principalController.text) ?? 0;
                    final rate = double.tryParse(rateController.text) ?? 0;
                    final time = double.tryParse(timeController.text) ?? 0;

                    context
                        .read<SimpleInterestCubit>()
                        .calculate(principal, rate, time);
                  },
                  child: const Text('Simple Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
