import 'package:flutter/material.dart';

import '../../../../core/presentation/section_widgets.dart';

class HomePillarsSection extends StatelessWidget {
  const HomePillarsSection({super.key});

  static const double _titleToContentGap = 26;
  static const double _sectionVerticalPadding = 72;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return FullBleedSection(
      background: cs.surfaceContainerLow,
      padding: const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(
            title: 'Une approche simple, orientée résultat',
            subtitle:
                'Du sur-mesure, de la clarté, et des outils qui restent utiles dans le temps.',
          ),
          SizedBox(height: _titleToContentGap),
          _PillarsGrid(),
        ],
      ),
    );
  }
}

/// Piliers : 3 colonnes si possible, sinon 1 colonne.
/// (Pas de 2 + 1.)
class _PillarsGrid extends StatelessWidget {
  const _PillarsGrid();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final maxW = c.maxWidth;

        // 3 * 280 + 2 * 16 = 872
        const cardW = 280.0;
        const gap = 16.0;
        const neededForThree = (cardW * 3) + (gap * 2);

        final useThree = maxW >= neededForThree;

        if (useThree) {
          return const Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _PillarCard(
                  icon: Icons.tune,
                  title: 'Sur-mesure utile',
                  body:
                      'Chaque solution est pensée pour répondre à un besoin précis. '
                      'Pas de superflu, pas de complexité inutile : juste ce qui sert vraiment.',
                ),
              ),
              SizedBox(width: gap),
              Expanded(
                child: _PillarCard(
                  icon: Icons.visibility_outlined,
                  title: 'Clarté et simplicité',
                  body:
                      'Un cadre clair, des échanges directs, des décisions compréhensibles. '
                      'Vous savez à tout moment où en est le projet et ce qui est mis en place.',
                ),
              ),
              SizedBox(width: gap),
              Expanded(
                child: _PillarCard(
                  icon: Icons.shield_outlined,
                  title: 'Pensé pour durer',
                  body:
                      'Des outils fiables, évolutifs et faciles à faire vivre dans le temps. '
                      'L’objectif est d’aboutir à une solution durable, adaptée à l’évolution de votre activité.',
                ),
              ),
            ],
          );
        }

        return const Column(
          children: [
            _PillarCard(
              icon: Icons.tune,
              title: 'Sur-mesure utile',
              body:
                  'Chaque solution est pensée pour répondre à un besoin précis. '
                  'Pas de superflu, pas de complexité inutile : juste ce qui sert vraiment.',
            ),
            SizedBox(height: gap),
            _PillarCard(
              icon: Icons.visibility_outlined,
              title: 'Clarté et simplicité',
              body:
                  'Un cadre clair, des échanges directs, des décisions compréhensibles. '
                  'Vous savez à tout moment où en est le projet et ce qui est mis en place.',
            ),
            SizedBox(height: gap),
            _PillarCard(
              icon: Icons.shield_outlined,
              title: 'Pensé pour durer',
              body:
                  'Des outils fiables, évolutifs et faciles à faire vivre dans le temps. '
                  'L’objectif est d’aboutir à une solution durable, adaptée à l’évolution de votre activité.',
            ),
          ],
        );
      },
    );
  }
}

class _PillarCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _PillarCard({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: 1, // fait ressortir sans “pâté”
      surfaceTintColor: Colors.transparent,
      color: cs.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: cs.outlineVariant.withValues(alpha: 0.35),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _IconBadge(icon: icon),
            const SizedBox(height: 14),
            Text(
              title,
              style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 10),
            Text(
              body,
              textAlign: TextAlign.justify,
              style: tt.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  const _IconBadge({required this.icon});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: cs.primaryContainer.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: cs.primary.withValues(alpha: 0.25)),
      ),
      child: Icon(icon, size: 20, color: cs.primary),
    );
  }
}






