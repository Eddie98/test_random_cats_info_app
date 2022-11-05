import 'package:flutter/material.dart';

class ButtonsRow extends StatelessWidget {
  final VoidCallback anotherFactCallback;
  final VoidCallback factHistoryCallback;

  const ButtonsRow({
    super.key,
    required this.anotherFactCallback,
    required this.factHistoryCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: anotherFactCallback,
            child: const Text('Another Fact!'),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: ElevatedButton(
            onPressed: factHistoryCallback,
            child: const Text('Fact history!'),
          ),
        ),
      ],
    );
  }
}
