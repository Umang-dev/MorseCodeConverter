import 'package:flutter/material.dart';
import 'package:morse_code_converter/feature/home/bloc/home_cubit/home_cubit.dart';

class ConvertedTextWidget extends StatelessWidget {
  const ConvertedTextWidget({super.key, required this.state});

  final HomeConvertState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const Text(
          'Converted Text:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Text(
          state.convertedString,
          style: const TextStyle(fontSize: 20.0, color: Colors.green),
        ),
      ],
    );
  }
}
