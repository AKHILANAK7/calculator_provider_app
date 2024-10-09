import 'package:calculator_provider_app/provider/calc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator(Provider)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 48,
              ),
              child: Text(
                calculator.output,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _buildButtonRow(context, ["7", "8", "9", "/"]),
                _buildButtonRow(context, ["4", "5", "6", "*"]),
                _buildButtonRow(context, ["3", "2", "1", "-"]),
                _buildButtonRow(context, ["C", "0", "=", "+","%"]),
                _buildButtonRow(context, ["="]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildButtonRow(BuildContext context, List<String> buttons) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: buttons.map((button) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => context.read<CalculatorProvider>().input(button),
              child: Text(
                button,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}
