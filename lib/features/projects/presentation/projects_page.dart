import 'package:flutter/material.dart';

import '../../../core/presentation/simple_content_page.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SimpleContentPage(
      title: 'Projets',
      children: [
        Text(
          "Une sélection de projets (et bientôt des détails, promis).",
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ProjectCard(title: 'Portfolio 2025', subtitle: 'Site Flutter Web'),
            _ProjectCard(
                title: 'App perso', subtitle: 'Organisation & productivité'),
          ],
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _ProjectCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return SizedBox(
      width: 360,
      child: Card(
        color: cs.surfaceContainerHigh,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: tt.titleLarge),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton(
                  onPressed: null, // plus tard
                  child: Text('Voir'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
