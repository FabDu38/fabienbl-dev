import 'package:flutter/material.dart';

import 'app_shell.dart';

/// Mise en page simple pour les pages de contenu
/// (titre, texte, blocs, etc.) avec :
/// - marge sous la navbar
/// - centrage + largeur max cohérente avec le reste du site.
class SimpleContentPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;

  const SimpleContentPage({
    super.key,
    required this.title,
    this.subtitle,
    this.children = const [],
  });

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
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: tt.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  subtitle!,
                  style: tt.bodyMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ],
              if (children.isNotEmpty) ...[
                const SizedBox(height: 24),
                ...children,
              ],
            ],
          ),
        ),
      ),
    );
  }
}






