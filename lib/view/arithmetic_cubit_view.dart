import 'package:classassignment2/cubit/arithmetic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArithmeticCubitView extends StatelessWidget {
  const ArithmeticCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstController = TextEditingController();
    final secondController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Binu Arithmetic cubit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: firstController,
                decoration: const InputDecoration(
                    labelText: 'First Number', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: secondController,
                decoration: const InputDecoration(
                    labelText: 'Second Number', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              BlocBuilder<ArithmeticCubit, int>(
                builder: (context, result) {
                  return Text(
                    'Result: $result',
                    style: const TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final firstNumber = int.tryParse(firstController.text) ?? 0;
                    final secondNumber =
                        int.tryParse(secondController.text) ?? 0;
                    context
                        .read<ArithmeticCubit>()
                        .add(firstNumber, secondNumber);
                  },
                  child: const Text('Addition'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final firstNumber = int.tryParse(firstController.text) ?? 0;
                    final secondNumber =
                        int.tryParse(secondController.text) ?? 0;
                    context
                        .read<ArithmeticCubit>()
                        .subtract(firstNumber, secondNumber);
                  },
                  child: const Text('Subtraction'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final firstNumber = int.tryParse(firstController.text) ?? 0;
                    final secondNumber =
                        int.tryParse(secondController.text) ?? 0;
                    context
                        .read<ArithmeticCubit>()
                        .multiply(firstNumber, secondNumber);
                  },
                  child: const Text('Multiply'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
