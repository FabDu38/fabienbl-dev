import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_shell.dart';

/// Widget pour créer un bouton sticky "Retour aux projets" qui reste fixe en haut de l'écran
class StickyBackButton extends StatelessWidget {
  final String route;

  const StickyBackButton({
    super.key,
    this.route = '/projets',
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);
    final safeAreaTop = mediaQuery.padding.top;
    // 64px pour la navbar + 8px d'espacement
    final topPosition = safeAreaTop + 64 + 8;

    return Positioned(
      top: topPosition,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: AppShell.contentMaxWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: cs.surface,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => context.go(route),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: cs.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Retour aux projets',
                          style: tt.bodyMedium?.copyWith(
                            color: cs.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Mixin pour gérer l'overlay du bouton sticky
mixin StickyBackButtonMixin<T extends StatefulWidget> on State<T> {
  OverlayEntry? _overlayEntry;

  void showStickyBackButton({String route = '/projets'}) {
    final overlay = Overlay.of(context, rootOverlay: true);
    _overlayEntry = OverlayEntry(
      builder: (context) => StickyBackButton(route: route),
      opaque: false,
    );
    overlay.insert(_overlayEntry!);
  }

  void removeStickyBackButton() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    removeStickyBackButton();
    super.dispose();
  }
}

