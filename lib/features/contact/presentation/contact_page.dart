import 'package:flutter/material.dart';

import '../../../core/presentation/simple_content_page.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SimpleContentPage(
      title: 'Contact',
      children: [
        Text(
          'Tu peux me joindre facilement via email ou LinkedIn.',
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: () {
                /* ouvrir mailto: */
              },
              child: const Text('M’écrire par email'),
            ),
            OutlinedButton(
              onPressed: () {
                // ouvrir LinkedIn
              },
              child: const Text('LinkedIn'),
            ),
          ],
        ),
      ],
    );
  }
}
