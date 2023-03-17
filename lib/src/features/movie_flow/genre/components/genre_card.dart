import 'package:flutter/material.dart';
import 'package:my_movie_app/src/core/constants.dart';
import 'package:my_movie_app/src/theme/palette.dart';

import '../genre.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({super.key, required this.genre, required this.onPressed});

  final Genre genre;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: genre.isSelected ? Palette.green600 : Palette.green300,
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        padding: const EdgeInsetsDirectional.all(kCardPadding),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            children: [
              Expanded(child: Image.asset('assets/images/${genre.imageUrl}')),
              const SizedBox(height: kCardPadding / 2),
              Text(
                genre.name,
                style: theme.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
