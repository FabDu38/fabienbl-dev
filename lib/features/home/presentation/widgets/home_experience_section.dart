import 'package:flutter/material.dart';

import '../../../../core/presentation/section_widgets.dart';

class HomeExperienceSection extends StatelessWidget {
  const HomeExperienceSection({super.key});

  static const double _titleToContentGap = 26;
  static const double _sectionVerticalPadding = 72;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return FullBleedSection(
      background: cs.surfaceContainerLowest,
      padding: const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            title: 'Une expérience solide, au service de projets concrets',
            subtitle:
                'Startups, PME, grands groupes : des contextes différents, le même objectif — faire simple, utile et durable.',
          ),
          SizedBox(height: _titleToContentGap),
          InfoCard(
            child: BulletList(items: [
              'Plus de 20 ans d’expérience dans le développement de solutions numériques',
              'Des projets menés dans des contextes variés : startups, PME et grands groupes',
              'Une approche pragmatique, centrée sur l’usage et la réalité du terrain',
              'Un accompagnement direct et impliqué, du premier échange jusqu’à une solution pleinement utilisable',
            ]),
          ),
        ],
      ),
    );
  }
}


