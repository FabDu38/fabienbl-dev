import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/section_widgets.dart';

class HomeHeroSection extends StatelessWidget {
  final TextStyle? heroTitleStyle;
  final TextStyle? heroSubtitleStyle;
  final ButtonStyle ctaStyle;

  const HomeHeroSection({
    super.key,
    required this.heroTitleStyle,
    required this.heroSubtitleStyle,
    required this.ctaStyle,
  });

  static const double _sectionVerticalPadding = 72;
  static const double _ctaTopGap = 40;
  static const double _ctaBottomGap = 14;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return FullBleedSection(
      background: cs.surface,
      padding: const EdgeInsets.only(
        top: _sectionVerticalPadding,
        bottom: _sectionVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Des applications sur mesure,\nutiles aujourd’hui et durables dans le temps.',
            textAlign: TextAlign.center,
            style: heroTitleStyle?.copyWith(
              fontWeight: FontWeight.w800,
              height: 1.12,
            ),
          ),
          const SizedBox(height: 22),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              'J’accompagne vos projets de l’idée à une solution concrète et durable, '
              'adaptée aux enjeux réels de votre activité.',
              textAlign: TextAlign.center,
              style: heroSubtitleStyle?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(height: 22),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              'Freelance développeur multiplateforme avec 20 ans d’expérience, '
              'je travaille à distance sur des projets web, mobile et desktop.',
              textAlign: TextAlign.center,
              style: tt.bodyLarge?.copyWith(height: 1.5),
            ),
          ),
          const SizedBox(height: _ctaTopGap),
          FilledButton.icon(
            style: ctaStyle,
            onPressed: () => context.go('/contact'),
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('Discuter de mon besoin'),
          ),
          const SizedBox(height: _ctaBottomGap),
          Text(
            'Un premier échange pour clarifier votre besoin et définir la suite.',
            textAlign: TextAlign.center,
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}


