import 'package:cash_tab/utils.dart';
import 'package:cash_tab/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends ConsumerStatefulWidget {
  const SettingsView({super.key, required this.title});

  final String title;

  @override
  SettingsViewState createState() => SettingsViewState();
}

class SettingsViewState extends ConsumerState<SettingsView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final router = GoRouter.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.title.capitalize())),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: ListView(
          // TODO: Get real languages list and current lang
          children: [
            ListTile(
              title: Text(l10n!.language.capitalize()),
              onTap: () => {router.push('/settings/language')},
            )
          ],
        ),
      ),
    );
  }
}
