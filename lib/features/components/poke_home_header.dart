import 'package:flutter/material.dart';

class PokeHomeHeader extends StatelessWidget {
  const PokeHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            _buildBall(Colors.white, 70.0),
            _buildBall(Colors.blue, 64.0),
          ],
        ),
        SizedBox(width: 32.0,), // Red ball
        _buildBall(Color.fromRGBO(209, 12, 65, 1.0), 18.0),
        const SizedBox(width: 8), // Spacing between balls
        _buildBall(Colors.yellow, 18.0), // Yellow ball
        const SizedBox(width: 8), // Spacing between balls
        _buildBall(Colors.green, 18.0), // Green ball
      ],
    );
  }

  Widget _buildBall(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
    );
  }
}