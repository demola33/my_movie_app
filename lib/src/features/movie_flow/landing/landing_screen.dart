import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:my_movie_app/src/theme/palette.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/primary_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: Palette.green900,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/landing_page.png'),
              Column(
                children: [
                  Text(
                    l10n.findMovieLabel,
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: kMediumSpacing / 2),
                  Text(
                    'The Best Movie recommendations app on the planet!',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              PrimaryButton(
                label: l10n.getStartedButton,
                width: 250,
                onPressed: nextPage,
              ),
              const SizedBox(height: kMediumSpacing)
            ],
          ),
        ),
      ),
    );
  }
}
