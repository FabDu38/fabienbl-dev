import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('À propos', style: tt.headlineSmall),
        const SizedBox(height: 12),
        Text(
          "Développeur avec une solide expérience, je conçois des interfaces "
          "claires et efficaces, avec une attention particulière à la qualité et aux détails.",
          style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
        ),
        const SizedBox(height: 24),
        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            _Chip(label: 'Flutter'),
            _Chip(label: 'Web'),
            _Chip(label: 'UI/UX'),
            _Chip(label: 'Agile'),
            _Chip(label: 'Freelance'),
          ],
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

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
