import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  static const double contentMaxWidth = 900;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    final width = MediaQuery.of(context).size.width;
    final isWide = width >= 900;

    // Conteneur “site” pour le contenu (colonne)
    Widget contentFrame(Widget child) {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: contentMaxWidth),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(width: double.infinity, child: child),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: cs.surface,

      // Drawer mobile
      drawer: isWide
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(color: cs.primary),
                    child: Text(
                      'Navigation',
                      style: tt.titleMedium?.copyWith(
                        color: cs.onPrimary,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const DrawerItem(label: 'Accueil', route: '/'),
                  const DrawerItem(label: 'Projets', route: '/projets'),
                  const DrawerItem(label: 'À propos', route: '/a-propos'),
                  const DrawerItem(label: 'Contact', route: '/contact'),
                ],
              ),
            ),

      body: Column(
        children: [
          // =========================
          // HEADER / NAVBAR (FULL WIDTH, alignement "web")
          // =========================
          Material(
            color: cs.surfaceContainerHigh,
            child: SafeArea(
              bottom: false,
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: Padding(
                  // IMPORTANT : padding global de page (web)
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      // Titre collé à gauche (comme ta 2e capture)
                      Text(
                        'Fabien Blasquez – Développeur Web',
                        style: tt.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: cs.onSurface,
                        ),
                      ),

                      const Spacer(),

                      // Liens collés à droite (comme ta 2e capture)
                      if (isWide) ...[
                        const NavButton(label: 'Accueil', route: '/'),
                        const SizedBox(width: 8),
                        const NavButton(label: 'Projets', route: '/projets'),
                        const SizedBox(width: 8),
                        const NavButton(label: 'À propos', route: '/a-propos'),
                        const SizedBox(width: 8),
                        const NavButton(label: 'Contact', route: '/contact'),
                      ] else
                        Builder(
                          builder: (context) => IconButton(
                            tooltip: 'Menu',
                            icon: const Icon(Icons.menu),
                            color: cs.onSurface,
                            onPressed: () => Scaffold.of(context).openDrawer(),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // =========================
          // BODY (colonne propre)
          // =========================
          Expanded(
            child: SingleChildScrollView(
              child: contentFrame(
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 24),
                  child: child,
                ),
              ),
            ),
          ),

          // =========================
          // FOOTER (FULL WIDTH, style identique header)
          // =========================
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: cs.surfaceContainerHigh,
            child: Center(
              child: Text(
                '© 2025 – Fabien Blasquez. Tous droits réservés.',
                style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================
// NAV BUTTON
// =====================
class NavButton extends StatelessWidget {
  final String label;
  final String route;

  const NavButton({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    final current = GoRouterState.of(context).uri.toString();
    final isActive = current == route;

    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.go(route),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isActive
                ? cs.primaryContainer.withValues(alpha: 0.18)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: isActive
                ? Border.all(
                    color: cs.primary.withValues(alpha: 0.35),
                  )
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: tt.titleMedium?.copyWith(
                  fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
                  color: isActive ? cs.primary : cs.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: 2,
                width: isActive ? 18 : 0,
                decoration: BoxDecoration(
                  color: cs.primary,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================
// DRAWER ITEM
// =====================
class DrawerItem extends StatelessWidget {
  final String label;
  final String route;

  const DrawerItem({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    final current = GoRouterState.of(context).uri.toString();
    final isActive = current == route;

    return ListTile(
      selected: isActive,
      selectedTileColor: cs.primaryContainer.withValues(alpha: 0.18),
      leading:
          isActive ? Icon(Icons.circle, size: 10, color: cs.primary) : null,
      title: Text(
        label,
        style: tt.bodyLarge?.copyWith(
          fontWeight: isActive ? FontWeight.w800 : FontWeight.w500,
          color: isActive ? cs.primary : cs.onSurface,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
    );
  }
}
