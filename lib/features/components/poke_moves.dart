import 'package:flutter/material.dart';

class PokeMoves extends StatelessWidget {
  final List<String> moves;
  const PokeMoves({super.key, required this.moves});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
      itemBuilder: (_, index) => Text(
        moves[index],
        style: textTheme.bodySmall?.copyWith(color: const Color(0xFF747476)),
      ),
      itemCount: moves.length,
    );
  }
}
