import 'package:flutter/material.dart';

import '../../../core/presentation/simple_content_page.dart';

class CguPage extends StatelessWidget {
  const CguPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SimpleContentPage(
      title: 'Conditions générales d’utilisation',
      children: [
        Text(
          'Conditions générales d’utilisation à venir.',
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
      ],
    );
  }
}
