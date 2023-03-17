import 'package:flutter/material.dart';
import 'package:my_movie_app/src/features/movie_flow/genre/components/genre_card.dart';
import 'package:my_movie_app/src/features/movie_flow/genre/genre.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/transparent_text_icon_button.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({
    super.key,
    required this.nextPage,
    required this.previousPage,
  });

  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  List<Genre> genres = const [
    Genre(name: 'Action', imageUrl: 'action.png'),
    Genre(name: 'Romance', imageUrl: 'romance.png'),
    Genre(name: 'Horror', imageUrl: 'horror.png'),
    Genre(name: 'Anime', imageUrl: 'anime.png'),
    Genre(name: 'Comedy', imageUrl: 'comedy.png'),
    Genre(name: 'Drama', imageUrl: 'drama.png'),
    Genre(name: 'Family', imageUrl: 'family.png'),
  ];

  void toggleSelected(Genre genre) {
    List<Genre> updatedGenres = [
      for (final oldGenre in genres)
        if (oldGenre == genre) oldGenre.toggleSelected() else oldGenre,
    ];

    setState(() {
      genres = updatedGenres;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.previousPage),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: kListItemSpacing * 2,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                l10n.selectGenreLabel,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: kMediumSpacing / 2),
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(kBorderRadius)),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: kListItemSpacing,
                    crossAxisSpacing: kListItemSpacing,
                    physics: const BouncingScrollPhysics(),
                    children: genres
                        .map(
                          (genre) => GenreCard(
                            genre: genre,
                            onPressed: () => toggleSelected(genre),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: kMediumSpacing / 2),
              TransparentTextIconButton(
                label: l10n.continueButton,
                onPressed: widget.nextPage,
              ),
              const SizedBox(height: kMediumSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
