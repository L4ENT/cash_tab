import 'package:cash_tab/components/bottom_navigation.dart';
import 'package:cash_tab/providers/settings_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:cash_tab/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagesView extends ConsumerStatefulWidget {
  const LanguagesView({super.key, required this.title});

  final String title;

  @override
  LanguagesViewState createState() => LanguagesViewState();
}

class LanguagesViewState extends ConsumerState<LanguagesView> {
  @override
  Widget build(BuildContext context) {
    const locales = AppLocalizations.supportedLocales;
    final language = ref.watch(languageProvider);
    Locale currentLocale = Localizations.localeOf(context);
    final languageNotifier = ref.read(languageProvider.notifier);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title.capitalize())),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...locales.map(
                    (Locale l) => GestureDetector(
                      onTap: () async {
                        languageNotifier.set(l.languageCode);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                languages[l.languageCode]!,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                          if (language == l.languageCode)
                            Icon(
                              Icons.check,
                              color: theme.iconTheme.color,
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
