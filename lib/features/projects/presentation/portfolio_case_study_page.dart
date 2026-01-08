import 'package:flutter/material.dart';

import '../../../core/presentation/section_widgets.dart';
import '../../../core/presentation/app_shell.dart';
import '../../../core/presentation/sticky_back_button.dart';

class PortfolioCaseStudyPage extends StatefulWidget {
  const PortfolioCaseStudyPage({super.key});

  @override
  State<PortfolioCaseStudyPage> createState() => _PortfolioCaseStudyPageState();
}

class _PortfolioCaseStudyPageState extends State<PortfolioCaseStudyPage>
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
    const portfolioColor = Color(0xFF027DFD); // Bleu Flutter

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
              // Carte header avec icône et titre
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: portfolioColor.withValues(alpha: 0.3),
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
                        portfolioColor.withValues(alpha: 0.08),
                        portfolioColor.withValues(alpha: 0.03),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: portfolioColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: portfolioColor.withValues(alpha: 0.4),
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.web,
                            color: portfolioColor,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Portfolio professionnel',
                                style: tt.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: portfolioColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Application Flutter Web',
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
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Accroche
              Text(
                'Application Flutter Web conçue comme une vitrine professionnelle et un socle '
                'technique multiplateforme.',
                style: tt.bodyLarge?.copyWith(
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Divider(color: cs.outlineVariant),
              const SizedBox(height: 32),

              // Contexte & intention
              _Section(
                title: 'Contexte & intention',
                children: [
                  Text(
                    'Ce projet correspond à mon site professionnel.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Il a été pensé non comme un simple site statique, mais comme une application '
                    'Flutter Web structurée, servant à la fois de vitrine et de base technique pour '
                    'des évolutions futures.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'L\'objectif était de travailler Flutter dans un contexte réel, avec des '
                    'contraintes de lisibilité, de maintenabilité et de déploiement, plutôt que dans '
                    'un projet démonstrateur artificiel.',
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

              // Problématique
              _Section(
                title: 'Problématique',
                children: [
                  Text(
                    'Concevoir une application :',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BulletList(
                    items: [
                      'lisible sur tous les formats (desktop, tablette, mobile),',
                      'simple à maintenir et à faire évoluer,',
                      'sans sur-ingénierie inutile,',
                      'tout en respectant une logique de produit claire.',
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Divider(color: cs.outlineVariant),
              const SizedBox(height: 32),

              // Approche & mise en œuvre
              _Section(
                title: 'Approche & mise en œuvre',
                children: [
                  Text(
                    'Le projet a été conçu comme une application Flutter Web complète, avec une '
                    'attention particulière portée à la structure et à la lisibilité du code :',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BulletList(
                    items: [
                      'organisation modulaire des écrans et des sections',
                      'composants réutilisables',
                      'navigation multi-pages',
                      'gestion du responsive',
                      'animations légères et maîtrisées',
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'L\'ensemble a été pensé pour rester sobre, lisible et évolutif, même sur un '
                    'périmètre volontairement contenu.',
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

              // Organisation du travail et qualité
              _Section(
                title: 'Organisation du travail et qualité',
                children: [
                  Text(
                    'Le projet a été mené avec une organisation inspirée des pratiques agiles, en '
                    'privilégiant des cycles courts et itératifs.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Chaque évolution est pensée comme une amélioration progressive, validée '
                    'fonctionnellement avant d\'être intégrée.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Le développement s\'appuie également sur une intégration continue, permettant '
                    'de tester, déployer et maintenir le projet de manière fiable et régulière.',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Cette approche garantit une base stable, facilite les évolutions et limite les '
                    'régressions.',
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

              // Choix techniques
              _Section(
                title: 'Choix techniques',
                children: [
                  const BulletList(
                    items: [
                      'Flutter Web comme socle principal',
                      'approche multiplateforme dès la conception',
                      'codebase unique, structuré pour évoluer vers d\'autres supports (mobile, desktop)',
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Les choix techniques ont été guidés par la simplicité, la maintenabilité et la '
                    'capacité d\'évolution du projet.',
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

              // Ce que ce projet démontre
              _Section(
                title: 'Ce que ce projet démontre',
                children: [
                  Text(
                    'Ce projet illustre ma capacité à :',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BulletList(
                    items: [
                      'structurer une application Flutter Web proprement,',
                      'raisonner en termes d\'usage et de produit,',
                      'poser des bases techniques saines,',
                      'travailler avec une logique projet claire,',
                      'concevoir une application prête à évoluer dans le temps.',
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Il sert aujourd\'hui de référence technique et de support de discussion pour '
                    'des projets clients.',
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

              // Évolutions possibles
              _Section(
                title: 'Évolutions possibles',
                children: [
                  Text(
                    'Cette base est volontairement conçue pour pouvoir évoluer vers :',
                    style: tt.bodyMedium?.copyWith(
                      color: cs.onSurfaceVariant,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const BulletList(
                    items: [
                      'des fonctionnalités dynamiques,',
                      'des intégrations de services externes,',
                      'un déploiement multiplateforme web / mobile.',
                    ],
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
                    'Conception, développement et mise en production.',
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
