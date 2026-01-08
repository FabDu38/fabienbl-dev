import 'package:flutter/material.dart';

import '../../../../core/presentation/section_widgets.dart';

class HomeServicesSection extends StatelessWidget {
  const HomeServicesSection({super.key});

  static const double _titleToContentGap = 26;
  static const double _sectionVerticalPadding = 72;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return FullBleedSection(
      background: cs.surface,
      padding: const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            title: 'Ce que je fais concrètement',
            subtitle:
                'Une prestation simple à comprendre : on clarifie, on construit, puis on améliore.',
          ),
          SizedBox(height: _titleToContentGap),
          BulletList(items: [
            'Conception et développement d’applications sur mesure, adaptées à vos usages réels',
            'Accompagnement de projets numériques, de l’idée jusqu’à une solution utilisable',
            'Suivi, évolutions et amélioration continue des outils mis en place',
          ]),
        ],
      ),
    );
  }
}






