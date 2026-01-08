import 'package:flutter/material.dart';

import '../../../core/presentation/section_widgets.dart';
import '../../../core/presentation/app_shell.dart';
import '../../../core/presentation/sticky_back_button.dart';

class ProfessionalProjectsPage extends StatefulWidget {
  const ProfessionalProjectsPage({super.key});

  @override
  State<ProfessionalProjectsPage> createState() =>
      _ProfessionalProjectsPageState();
}

class _ProfessionalProjectsPageState extends State<ProfessionalProjectsPage>
    with StickyBackButtonMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showStickyBackButton();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppShell.contentMaxWidth,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projets professionnels en entreprise',
                style: tt.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Les projets présentés ci-dessous reflètent mon expérience en environnement '
                'entreprise, sur des applications et outils métier intégrés à des contextes '
                'industriels, organisationnels et humains réels.',
                style: tt.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Ils m\'ont permis de travailler sur des problématiques de fiabilité, de '
                'maintenabilité et d\'évolution d\'outils existants, souvent au plus près '
                'des utilisateurs.',
                style: tt.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Divider(color: cs.outlineVariant),
              const SizedBox(height: 32),

              // Parcours et projets
              _Section(
                title: 'Parcours et projets',
                children: [
                  const SizedBox(height: 8),
                  // Supplyframe / Siemens
                  _CompanyCard(
                    companyName: 'Supplyframe (groupe Siemens)',
                    period: '2017 à 2025',
                    color: const Color(0xFF009999), // Bleu Siemens
                    icon: Icons.business,
                    projects: [
                      _ProjectCard(
                        title:
                            'Développement applicatif, R&D et responsabilité technique',
                        description:
                            'Participation au développement et à l\'évolution de plusieurs modules '
                            'applicatifs dans une startup grenobloise, puis dans un contexte de rachat '
                            'et d\'intégration à un grand groupe.',
                        items: [
                          'la création et l\'évolution de modules web,',
                          'la modernisation de fonctionnalités existantes,',
                          'la collaboration avec des équipes internationales,',
                          'la prise de responsabilités en R&D au sein de l\'agence de Grenoble.',
                        ],
                        additionalText:
                            'En parallèle, j\'ai été responsable technique du logiciel historique, '
                            'développé sous Windev, utilisé par une trentaine de grands comptes à son '
                            'pic d\'utilisation.\n\n'
                            'À ce titre, j\'ai assuré :',
                        additionalItems: [
                          'la maintenance et l\'évolution du produit,',
                          'la fiabilité et la stabilité des livraisons,',
                          'l\'intégration de nouveaux modules et APIs,',
                          'la continuité technique du produit dans un contexte de transformation.',
                        ],
                        finalText:
                            'Les projets étaient menés dans une organisation agile, en lien étroit '
                            'avec les équipes produit.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Schneider Electric
                  _CompanyCard(
                    companyName: 'Schneider Electric',
                    period: '2015 à 2017, 2024 à 2025',
                    color: const Color(0xFF78BE20), // Vert Schneider
                    icon: Icons.bolt,
                    projects: [
                      _ProjectCard(
                        title: 'Refonte d\'un datawarehouse',
                        location: 'Site de Montbonnot (2015 à 2017)',
                        description:
                            'Responsable de la refonte d\'un datawarehouse existant, initialement basé '
                            'sur une accumulation d\'outils hétérogènes (Excel, Access, traitements manuels).',
                        items: [
                          'le choix des technologies et de l\'architecture,',
                          'le recueil et la priorisation des besoins utilisateurs,',
                          'la mise en place d\'un intranet applicatif structuré,',
                          'la transmission de la solution aux équipes IT internes.',
                        ],
                      ),
                      _ProjectCard(
                        title:
                            'Outils métier pour l\'ordonnancement et la logistique',
                        location: 'Site de Fontanil (2024 à 2025)',
                        description:
                            'Conception et évolution d\'outils destinés aux équipes d\'ordonnancement '
                            'et de logistique, avec une immersion forte dans le métier afin de comprendre '
                            'les contraintes opérationnelles.',
                        items: [
                          'des échanges quotidiens avec les équipes terrain,',
                          'la conception d\'outils adaptés aux usages réels,',
                          'la création d\'indicateurs et de supports d\'aide à la décision pour le management.',
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Alfa Laval
                  _CompanyCard(
                    companyName: 'Alfa Laval',
                    period: '2012 à 2013',
                    color: const Color(0xFF003366), // Bleu foncé Alfa Laval
                    icon: Icons.settings,
                    projects: [
                      _ProjectCard(
                        title: 'Outils internes pour le bureau d\'études',
                        location: 'Fontanil',
                        description:
                            'Réalisation d\'outils destinés au bureau d\'études et aux chargés '
                            'd\'affaires, ainsi que d\'un intranet interne.',
                        items: [
                          'l\'automatisation de tâches métier,',
                          'l\'amélioration de la fiabilité des données,',
                          'l\'adaptation des outils aux usages réels des équipes.',
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // BF Web Création
                  _CompanyCard(
                    companyName: 'BF Web Création',
                    period: '2008 à 2013',
                    color: const Color(0xFF6B46C1), // Violet
                    icon: Icons.code,
                    projects: [
                      _ProjectCard(
                        title: 'Développement web en indépendant',
                        description:
                            'Création de sites web pour des clients professionnels en tant qu\'indépendant.',
                        items: [],
                        finalText:
                            'Ces projets m\'ont permis de travailler directement avec les clients, '
                            'de l\'expression du besoin à la mise en ligne, et de poser des bases '
                            'solides en développement web.',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(color: cs.outlineVariant),
              const SizedBox(height: 32),

              // Contextes d'intervention
              _Section(
                title: 'Contextes d\'intervention',
                children: [
                  Text(
                    'J\'ai principalement travaillé sur :',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BulletList(
                    items: [
                      'des outils internes destinés aux équipes opérationnelles (ordonnancement, logistique, bureaux d\'études),',
                      'des applications métier utilisées en production,',
                      'des projets nécessitant une compréhension fine des processus existants avant toute évolution technique.',
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Les projets s\'inscrivaient majoritairement dans des contextes long terme, '
                    'avec des enjeux de continuité, de qualité et d\'adoption par les utilisateurs.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(color: cs.outlineVariant),
              const SizedBox(height: 32),

              // Ce que ces expériences m'ont apporté
              _Section(
                title: 'Ce que ces expériences m\'ont apporté',
                children: [
                  Text(
                    'Ces projets m\'ont permis de développer une approche très pragmatique du '
                    'développement logiciel :',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BulletList(
                    items: [
                      'travailler sur de l\'existant complexe et critique,',
                      'assumer des responsabilités techniques sur des produits utilisés en production,',
                      'livrer dans des contextes contraints (techniques, métiers, organisationnels),',
                      'dialoguer avec des profils non techniques,',
                      'privilégier la robustesse et la pérennité des solutions plutôt que l\'effet vitrine.',
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'C\'est cette expérience qui nourrit aujourd\'hui ma façon de concevoir des '
                    'projets, y compris en freelance.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(color: cs.outlineVariant),
              const SizedBox(height: 32),

              // Rôle
              _Section(
                title: 'Rôle',
                children: [
                  Text(
                    'Conception, développement, évolution d\'applications et responsabilité technique, '
                    'en lien direct avec les équipes métiers et produit.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _Section({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: tt.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }
}

class _CompanyCard extends StatelessWidget {
  final String companyName;
  final String period;
  final Color color;
  final IconData icon;
  final List<_ProjectCard> projects;

  const _CompanyCard({
    required this.companyName,
    required this.period,
    required this.color,
    required this.icon,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: color.withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withValues(alpha: 0.08),
              color.withValues(alpha: 0.03),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header avec icône et nom de l'entreprise
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: color.withValues(alpha: 0.4),
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      icon,
                      color: color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          companyName,
                          style: tt.titleLarge?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: color,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          period,
                          style: tt.bodyMedium?.copyWith(
                            color: cs.onSurfaceVariant,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Projets
              ...projects.map((project) => Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: project,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String? location;
  final String description;
  final List<String> items;
  final String? additionalText;
  final List<String>? additionalItems;
  final String? finalText;

  const _ProjectCard({
    required this.title,
    this.location,
    required this.description,
    required this.items,
    this.additionalText,
    this.additionalItems,
    this.finalText,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cs.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: cs.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: tt.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (location != null) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: cs.onSurfaceVariant,
                ),
                const SizedBox(width: 6),
                Text(
                  location!,
                  style: tt.bodySmall?.copyWith(
                    color: cs.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          Text(
            description,
            style: tt.bodyMedium?.copyWith(
              color: cs.onSurfaceVariant,
              height: 1.5,
            ),
          ),
          if (items.isNotEmpty) ...[
            const SizedBox(height: 16),
            BulletList(items: items),
          ],
          if (additionalText != null) ...[
            const SizedBox(height: 12),
            Text(
              additionalText!,
              style: tt.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
          if (additionalItems != null && additionalItems!.isNotEmpty) ...[
            const SizedBox(height: 16),
            BulletList(items: additionalItems!),
          ],
          if (finalText != null) ...[
            const SizedBox(height: 12),
            Text(
              finalText!,
              style: tt.bodyMedium?.copyWith(
                color: cs.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
