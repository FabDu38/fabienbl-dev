import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/simple_content_page.dart';
import '../../../core/presentation/section_widgets.dart';

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
          'Les projets présentés ici illustrent ma démarche de conception et ma façon '
          'de structurer des applications, plus qu\'une vitrine exhaustive de réalisations.',
          style: tt.bodyMedium?.copyWith(
            color: cs.onSurfaceVariant,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        const _ProjectCard(
          title: 'Projets professionnels en entreprise',
          subtitle: 'Applications et outils métier',
          description:
              'Projets réalisés en environnement entreprise, sur des applications et '
              'outils métier, du cadrage à la mise en production.',
          tags: [
            'Applications métier',
            'Projet structuré',
            'Contexte industriel'
          ],
          actionType: ProjectActionType.context,
        ),
        const SizedBox(height: 16),
        const _ProjectCard(
          title: 'Portfolio professionnel',
          subtitle: 'Application Flutter Web',
          description:
              'Application Flutter Web servant de vitrine professionnelle et de socle '
              'technique multiplateforme.',
          tags: ['Flutter', 'Web', 'Multiplateforme'],
          actionType: ProjectActionType.caseStudy,
        ),
        const SizedBox(height: 16),
        const _ProjectCard(
          title: 'Outil de suivi d\'activités et d\'objectifs',
          subtitle: 'Application Flutter — en cours de développement',
          description:
              'Projet Flutter en cours visant à explorer des cas d\'usage concrets '
              'autour de la structuration des données, de la navigation et de l\'évolutivité.',
          tags: ['Flutter', 'Multiplateforme', 'En cours'],
          actionType: ProjectActionType.inProgress,
        ),
      ],
    );
  }
}

enum ProjectActionType {
  caseStudy,
  context,
  inProgress,
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final ProjectActionType actionType;

  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    required this.actionType,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: tt.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: tt.bodyMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              if (actionType == ProjectActionType.inProgress)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: cs.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'En cours',
                    style: tt.bodySmall?.copyWith(
                      color: cs.onPrimaryContainer,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: tt.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map(
                  (tag) => Chip(
                    label: Text(
                      tag,
                      style: tt.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    backgroundColor: cs.surfaceContainerHigh,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                  ),
                )
                .toList(),
          ),
          if (actionType != ProjectActionType.inProgress) ...[
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: OutlinedButton(
                onPressed: () {
                  if (actionType == ProjectActionType.caseStudy) {
                    context.go('/projets/portfolio');
                  } else if (actionType == ProjectActionType.context) {
                    context.go('/projets/professionnels');
                  }
                },
                child: Text(
                  actionType == ProjectActionType.caseStudy
                      ? 'Voir le cas d\'étude'
                      : 'Voir le contexte',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
