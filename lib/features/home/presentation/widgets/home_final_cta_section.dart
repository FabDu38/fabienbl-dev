import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/section_widgets.dart';

class HomeFinalCtaSection extends StatelessWidget {
  final ButtonStyle ctaStyle;

  const HomeFinalCtaSection({super.key, required this.ctaStyle});

  static const double _sectionVerticalPadding = 72;
  static const double _ctaTopGap = 40;
  static const double _ctaBottomGap = 14;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return FullBleedSection(
      background: cs.primaryContainer.withValues(alpha: 0.22),
      padding: const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SectionHeader(
            title: 'On en parle ?',
            subtitle:
                'Un premier échange pour comprendre votre besoin et voir si je suis la bonne personne pour vous accompagner.',
          ),
          const SizedBox(height: _ctaTopGap),
          FilledButton.icon(
            style: ctaStyle.copyWith(
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 34, vertical: 20),
              ),
            ),
            onPressed: () => context.go('/contact'),
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('Discuter de mon besoin'),
          ),
          const SizedBox(height: _ctaBottomGap),
          Text(
            'Je vous réponds rapidement avec une proposition claire et des prochaines étapes.',
            textAlign: TextAlign.center,
            style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}


