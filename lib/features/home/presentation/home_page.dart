import 'package:flutter/material.dart';

import 'widgets/home_experience_section.dart';
import 'widgets/home_final_cta_section.dart';
import 'widgets/home_hero_section.dart';
import 'widgets/home_pillars_section.dart';
import 'widgets/home_services_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _contentMaxWidth = 840;

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

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
        HomeHeroSection(
          heroTitleStyle: heroTitleStyle,
          heroSubtitleStyle: heroSubtitleStyle,
          ctaStyle: ctaStyle,
        ),
        const HomePillarsSection(),
        const HomeServicesSection(),
        const HomeExperienceSection(),
        HomeFinalCtaSection(ctaStyle: ctaStyle),
        const SizedBox(height: 8),
      ],
    );
  }
}
