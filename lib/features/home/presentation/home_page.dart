import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter_animate/flutter_animate.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _contentMaxWidth = 900;

  static const double _titleToContentGap = 26;
  static const double _sectionVerticalPadding = 72;

  // CTA spacing
  static const double _ctaTopGap = 40;
  static const double _ctaBottomGap = 14;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    final width = MediaQuery.of(context).size.width;
    final isWide = width >= _contentMaxWidth;

    final heroTitleStyle = isWide ? tt.displaySmall : tt.headlineMedium;
    final heroSubtitleStyle = isWide ? tt.titleLarge : tt.titleMedium;

    final ctaStyle = FilledButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
      textStyle: tt.titleMedium,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // =====================
        // HERO (centrée)
        // =====================
        _FullBleedSection(
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
        ),

        // =====================
        // PILIERS (bande teintée + plus contrastée)
        // =====================
        _FullBleedSection(
          background: cs.surfaceContainerLow, // plus visible que Lowest
          padding:
              const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionHeader(
                title: 'Une approche simple, orientée résultat',
                subtitle:
                    'Du sur-mesure, de la clarté, et des outils qui restent utiles dans le temps.',
              ),
              SizedBox(height: _titleToContentGap),
              _PillarsGrid(),
            ],
          ),
        ),

        // =====================
        // CE QUE JE FAIS
        // =====================
        _FullBleedSection(
          background: cs.surface,
          padding:
              const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionHeader(
                title: 'Ce que je fais concrètement',
                subtitle:
                    'Une prestation simple à comprendre : on clarifie, on construit, puis on améliore.',
              ),
              SizedBox(height: _titleToContentGap),
              _BulletList(items: [
                'Conception et développement d’applications sur mesure, adaptées à vos usages réels',
                'Accompagnement de projets numériques, de l’idée jusqu’à une solution utilisable',
                'Suivi, évolutions et amélioration continue des outils mis en place',
              ]),
            ],
          ),
        ),

        // =====================
        // CRÉDIBILITÉ
        // =====================
        _FullBleedSection(
          background: cs.surfaceContainerLowest,
          padding:
              const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SectionHeader(
                title: 'Une expérience solide, au service de projets concrets',
                subtitle:
                    'Startups, PME, grands groupes : des contextes différents, le même objectif — faire simple, utile et durable.',
              ),
              SizedBox(height: _titleToContentGap),
              _InfoCard(
                child: _BulletList(items: [
                  'Plus de 20 ans d’expérience dans le développement de solutions numériques',
                  'Des projets menés dans des contextes variés : startups, PME et grands groupes',
                  'Une approche pragmatique, centrée sur l’usage et la réalité du terrain',
                  'Un accompagnement direct et impliqué, du premier échange jusqu’à une solution pleinement utilisable',
                ]),
              ),
            ],
          ),
        ),

        // =====================
        // CTA FINAL (sans petit trait, plus cohérent)
        // =====================
        _FullBleedSection(
          background: cs.primaryContainer.withValues(alpha: 0.22),
          padding:
              const EdgeInsets.symmetric(vertical: _sectionVerticalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const _SectionHeader(
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
        ),

        const SizedBox(height: 8),
      ],
    );
  }
}

/// Section pleine largeur (fond full-bleed),
/// avec contenu centré et contraint à _contentMaxWidth.
class _FullBleedSection extends StatelessWidget {
  final Widget child;
  final Color background;
  final EdgeInsetsGeometry padding;

  const _FullBleedSection({
    required this.child,
    required this.background,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: HomePage._contentMaxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

/// Header de section (centré + accent visuel)
class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _SectionHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44,
          height: 4,
          decoration: BoxDecoration(
            color: cs.primary.withValues(alpha: 0.85),
            borderRadius: BorderRadius.circular(99),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          title,
          textAlign: TextAlign.center,
          style: tt.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.2,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: tt.bodyLarge?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ),
        ],
      ],
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

class _InfoCard extends StatelessWidget {
  final Widget child;

  const _InfoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: cs.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: child,
      ),
    );
  }
}

class _BulletList extends StatelessWidget {
  final List<String> items;

  const _BulletList({required this.items});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in items) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Icon(Icons.check_circle, size: 18, color: cs.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item,
                  textAlign: TextAlign.start,
                  style: tt.bodyLarge?.copyWith(height: 1.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}

/*
class _Reveal extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final double dy;

  const _Reveal({
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 420),
    this.dy = 12,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: duration,
      curve: Curves.easeOutCubic,
      child: child,
      builder: (context, t, child) {
        // petit "stagger" via delay sans Timer (propre et simple)
        final effectiveT = delay == Duration.zero
            ? t
            : (t - (delay.inMilliseconds / duration.inMilliseconds))
                .clamp(0.0, 1.0);

        return Opacity(
          opacity: effectiveT,
          child: Transform.translate(
            offset: Offset(0, (1 - effectiveT) * dy),
            child: child,
          ),
        );
      },
    );
  }
}*/
