import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Accueil', style: tt.headlineSmall),
          const SizedBox(height: 12),
          Text(
            'Bienvenue sur mon site 👋',
            style: tt.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Site actuellement en construction.',
            style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () {
                  // aller sur /projets
                },
                child: const Text('Voir mes projets'),
              ),
              OutlinedButton(
                onPressed: () {
                  // aller sur /contact
                },
                child: const Text('Me contacter'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
