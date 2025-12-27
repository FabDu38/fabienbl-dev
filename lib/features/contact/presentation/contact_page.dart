import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/presentation/section_widgets.dart';
import '../../../core/presentation/app_shell.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    final width = MediaQuery.of(context).size.width;
    final isWide = width >= AppShell.contentMaxWidth;

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
                'Contact',
                style: tt.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Vous pouvez me joindre facilement via le formulaire ci-dessous, ou directement par email ou LinkedIn.',
                style: tt.bodyMedium?.copyWith(
                  color: cs.onSurfaceVariant,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              if (isWide)
                // Layout en deux colonnes sur grand écran
                const IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: _ContactInfo(),
                      ),
                      SizedBox(width: 32),
                      Flexible(
                        flex: 2,
                        child: _ContactForm(),
                      ),
                    ],
                  ),
                )
              else
                // Layout vertical sur mobile
                const Column(
                  children: [
                    _ContactForm(),
                    SizedBox(height: 32),
                    Divider(),
                    SizedBox(height: 24),
                    _ContactInfo(),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return InfoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Me contacter directement',
            style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 24),
          _ContactItem(
            icon: Icons.email_outlined,
            value: 'contact@fabien-blasquez.dev',
            onTap: () async {
              final uri = Uri.parse('mailto:contact@fabien-blasquez.dev');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
          ),
          const SizedBox(height: 16),
          _ContactItem(
            value: 'fabien-blasquez',
            linkedInIcon: true,
            onTap: () async {
              final uri = Uri.parse(
                  'https://www.linkedin.com/in/fabien-blasquez-4aa16636/');
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData? icon;
  final String value;
  final bool linkedInIcon;
  final VoidCallback onTap;

  const _ContactItem({
    this.icon,
    required this.value,
    this.linkedInIcon = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: cs.primaryContainer.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: linkedInIcon
                  ? Image.asset(
                      'assets/icons/linkedin_174857.png',
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('Erreur chargement LinkedIn icon: $error');
                        return Icon(Icons.business_center_outlined,
                            color: cs.primary, size: 20);
                      },
                    )
                  : Icon(icon, color: cs.primary, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value,
                style: tt.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: cs.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm();

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // Envoi via EmailJS
      const serviceId = 'service_3ehoqgp';
      const templateId = 'template_n0s20gd';
      const publicKey = '9K8EyS_guLUXp0WnX';

      final requestBody = {
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': publicKey,
        'template_params': {
          'name': _nameController.text.trim(),
          'email': _emailController.text.trim(),
          'message': _messageController.text.trim(),
        },
      };

      debugPrint('EmailJS - Envoi en cours...');
      debugPrint('EmailJS - Body: ${jsonEncode(requestBody)}');

      final response = await http.post(
        Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      debugPrint('EmailJS - Status: ${response.statusCode}');
      debugPrint('EmailJS - Response: ${response.body}');

      if (!mounted) return;

      if (response.statusCode == 200) {
        // Vérifier que la réponse indique un succès
        final responseBody = response.body;
        if (responseBody.contains('OK') || responseBody.isEmpty) {
          // Afficher un message de succès
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Message envoyé avec succès ! Je vous répondrai rapidement.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
              duration: const Duration(seconds: 5),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );

          // Réinitialiser le formulaire
          _nameController.clear();
          _emailController.clear();
          _messageController.clear();
        } else {
          debugPrint('EmailJS - Réponse inattendue: $responseBody');
          throw Exception('Réponse EmailJS inattendue: $responseBody');
        }
      } else {
        // Afficher un message d'erreur avec plus de détails
        debugPrint(
            'EmailJS - Erreur HTTP ${response.statusCode}: ${response.body}');
        final errorMessage = response.statusCode == 400
            ? 'Erreur de configuration. Vérifiez vos identifiants EmailJS.'
            : response.statusCode == 403
                ? 'Accès refusé. Vérifiez votre clé publique.'
                : 'Erreur lors de l\'envoi (${response.statusCode}). Veuillez réessayer.';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.error,
                  color: Theme.of(context).colorScheme.onError,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onError,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 5),
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('EmailJS - Exception: $e');
      if (!mounted) return;

      // Afficher un message d'erreur
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.onError,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Erreur lors de l\'envoi du message. Veuillez réessayer.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onError,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return InfoCard(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Formulaire de contact',
              style: tt.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nom *',
                hintText: 'Votre nom',
                prefixIcon: const Icon(Icons.person_outline),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Le nom est requis';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email *',
                hintText: 'votre@email.com',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'L\'email est requis';
                }
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Email invalide';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Message *',
                hintText: 'Votre message...',
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 60),
                  child: Icon(Icons.message_outlined),
                ),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 6,
              minLines: 4,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Le message est requis';
                }
                if (value.trim().length < 10) {
                  return 'Le message doit contenir au moins 10 caractères';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _isSubmitting ? null : _handleSubmit,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ).copyWith(
                foregroundColor: WidgetStateProperty.all(
                  Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              child: _isSubmitting
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  : Text(
                      'Envoyer le message',
                      style: tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
