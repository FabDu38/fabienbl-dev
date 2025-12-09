import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      // HEADER
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Fabien Blasquez – Développeur Web',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,

        // Nav desktop
        actions: isWide
            ? [
                const NavButton(label: 'Accueil', route: '/'),
                const NavButton(label: 'Projets', route: '/projets'),
                const NavButton(label: 'À propos', route: '/a-propos'),
                const NavButton(label: 'Contact', route: '/contact'),
              ]
            : null,
      ),

      // Drawer mobile
      drawer: isWide
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  DrawerHeader(
                    decoration: BoxDecoration(color: Colors.blueGrey),
                    child: Text(
                      'Navigation',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  DrawerItem(label: 'Accueil', route: '/'),
                  DrawerItem(label: 'Projets', route: '/projets'),
                  DrawerItem(label: 'À propos', route: '/a-propos'),
                  DrawerItem(label: 'Contact', route: '/contact'),
                ],
              ),
            ),

      // CONTENU + FOOTER
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: child,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.black87,
            child: const Center(
              child: Text(
                '© 2025 – Fabien Blasquez. Tous droits réservés.',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String label;
  final String route;

  const NavButton({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.go(route);
      },
      child: Text(label),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String label;
  final String route;

  const DrawerItem({super.key, required this.label, required this.route});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      onTap: () {
        Navigator.of(context).pop(); // fermer le drawer
        context.go(route);
      },
    );
  }
}
