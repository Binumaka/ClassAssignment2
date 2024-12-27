import 'package:classassignment2/cubit/areaofcircle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaOfCircleView extends StatelessWidget {
  const AreaOfCircleView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Binu Area of Circle Cubit'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: radiusController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Radius',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<AreaOfCircleCubit, double>(
                builder: (context, result) {
                  return Text(
                    'Result: ${result.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final radius = double.tryParse(radiusController.text) ?? 0.0;
                    context.read<AreaOfCircleCubit>().calculateArea(radius);
                  },
                  child: const Text('Area of Circle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
