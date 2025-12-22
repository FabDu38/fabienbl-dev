import 'package:flutter/material.dart';

import '../../../core/presentation/simple_content_page.dart';
import '../../../core/presentation/section_widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SimpleContentPage(
      title: 'À propos',
      children: [
        _AboutIntro(tt: tt, cs: cs),
        const SizedBox(height: 24),
        Divider(color: cs.outlineVariant),
        const SizedBox(height: 24),
        _AboutJourney(tt: tt, cs: cs),
        const SizedBox(height: 24),
        Divider(color: cs.outlineVariant),
        const SizedBox(height: 24),
        _AboutHowIWork(tt: tt, cs: cs),
        const SizedBox(height: 24),
        Divider(color: cs.outlineVariant),
        const SizedBox(height: 24),
        const _AboutKeywords(),
      ],
    );
  }
}

class _AboutIntro extends StatelessWidget {
  final TextTheme tt;
  final ColorScheme cs;

  const _AboutIntro({required this.tt, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ce que je fais',
          style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Text(
          "Développeur freelance, Flutter est aujourd’hui au cœur de mon travail pour "
          "concevoir des applications web, mobile et desktop. Mon objectif est simple : "
          "proposer des solutions claires, utiles et durables, adaptées aux besoins réels "
          "des PME et indépendants.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
        const SizedBox(height: 12),
        Text(
          "Mon approche privilégie la simplicité, la lisibilité et l’efficacité, aussi bien "
          "côté utilisateur que côté technique.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
      ],
    );
  }
}

class _AboutJourney extends StatelessWidget {
  final TextTheme tt;
  final ColorScheme cs;

  const _AboutJourney({required this.tt, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Parcours',
          style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Text(
          "Après plusieurs années en indépendant dans le développement web, j’ai évolué "
          "sur des projets plus structurants au sein de grands groupes comme Schneider "
          "Electric et Siemens.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
        const SizedBox(height: 8),
        Text(
          "Chez Supplyframe (groupe Siemens), j’ai occupé un rôle de Project Leader sur "
          "des projets internationaux, en lien étroit avec les équipes produit et "
          "techniques, autour de problématiques concrètes de qualité, fiabilité et "
          "exploitation.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
        const SizedBox(height: 8),
        Text(
          "Ces expériences m’ont permis de développer une vision pragmatique des projets "
          "logiciels : comprendre le contexte, composer avec l’existant, et livrer des "
          "solutions exploitables dans la durée.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
      ],
    );
  }
}

class _AboutHowIWork extends StatelessWidget {
  final TextTheme tt;
  final ColorScheme cs;

  const _AboutHowIWork({required this.tt, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comment je travaille',
          style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Text(
          "Flutter structure aujourd’hui mon approche : un seul codebase pour des "
          "applications web, mobile et desktop, avec une attention particulière portée à "
          "la cohérence, à la maintenabilité et à l’expérience utilisateur.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
        const SizedBox(height: 8),
        Text(
          "J’interviens aussi bien en création qu’en reprise ou en évolution de projets "
          "existants. Ma façon de travailler s’adapte à la taille et à la maturité du "
          "projet :",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
        const SizedBox(height: 16),
        const BulletList(
          items: [
            "Cadrage du besoin et du contexte : comprendre l’objectif réel, les "
                "contraintes et les usages.",
            "Base fonctionnelle solide : une première version utilisable, pensée pour "
                "évoluer.",
            "Itérations structurées : améliorations progressives et priorisées, avec une "
                "attention constante à la qualité.",
            "Mise en production et suivi : tests, ajustements, stabilisation et "
                "accompagnement dans la durée.",
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "Les choix techniques servent le projet et son contexte, pas une tendance ou "
          "une stack à la mode.",
          style:
              tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant, height: 1.5),
        ),
      ],
    );
  }
}

class _AboutKeywords extends StatelessWidget {
  const _AboutKeywords();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'En quelques mots',
          style: tt.titleMedium?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _KeywordChip('Flutter'),
            _KeywordChip('Multiplateforme'),
            _KeywordChip('Applications métier'),
            _KeywordChip('UX pragmatique'),
            _KeywordChip('Intégrations'),
            _KeywordChip('Automatisation'),
            _KeywordChip('Gestion de projet'),
          ],
        ),
      ],
    );
  }
}

class _KeywordChip extends StatelessWidget {
  final String label;
  const _KeywordChip(this.label);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Chip(
      backgroundColor: cs.surfaceContainerHigh,
      label: Text(label, style: tt.bodyMedium),
    );
  }
}
