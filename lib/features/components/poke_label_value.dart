import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

class PokeLabelValue extends StatelessWidget {
  final String label;
  final String value;
  const PokeLabelValue({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: textTheme.bodySmall
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: textTheme.bodySmall?.copyWith(color: const Color(0xFF747476)),
        )
      ],
    );
  }
}
