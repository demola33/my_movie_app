import 'package:flutter/material.dart';

import '../constants.dart';

class TransparentTextIconButton extends StatelessWidget {
  const TransparentTextIconButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: kMediumSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Row(
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelLarge,
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
