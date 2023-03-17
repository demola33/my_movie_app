import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_movie_app/src/core/constants.dart';
import 'package:my_movie_app/src/core/widgets/primary_button.dart';

import '../../../core/widgets/transparent_text_icon_button.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              l10n.selectRatingLabel,
              style: theme.textTheme.headlineSmall,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${rating.ceil()}',
                    style: theme.textTheme.displayMedium,
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 62,
                  )
                ],
              ),
            ),
            Slider.adaptive(
              value: rating,
              min: 1.0,
              max: 10.0,
              divisions: 9,
              label: '${rating.ceil()}',
              onChanged: (newRating) {
                setState(() {
                  rating = newRating;
                });
              },
            ),
            const SizedBox(height: kMediumSpacing),
            TransparentTextIconButton(
              label: l10n.continueButton,
              onPressed: widget.nextPage,
            ),
            const SizedBox(height: kMediumSpacing),
          ],
        ),
      ),
    );
  }
}
