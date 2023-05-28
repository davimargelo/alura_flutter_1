import 'package:flutter/material.dart';

class DifficultyStars extends StatelessWidget {
  const DifficultyStars({super.key, required this.difficultyLevel});

  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Icon(Icons.star,
              size: 15, color: Colors.blue[(i > difficultyLevel ? 100 : 500)]),
      ],
    );
  }
}
