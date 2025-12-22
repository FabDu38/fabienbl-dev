import 'package:flutter/material.dart';

import '../../../core/presentation/simple_content_page.dart';

class MentionsLegalesPage extends StatelessWidget {
  const MentionsLegalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SimpleContentPage(
      title: 'Mentions légales',
      children: [
        Text(
          'Mentions légales à venir.',
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
      ],
    );
  }
}
