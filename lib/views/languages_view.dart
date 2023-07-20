import 'package:cash_tab/components/bottom_navigation.dart';
import 'package:cash_tab/utils.dart';
import 'package:cash_tab/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    Locale currentLocale = Localizations.localeOf(context);
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
                // TODO: Get real languages list and current lang
                children: [
                  ...locales.map(
                    (Locale l) => Row(
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
                        if (currentLocale.languageCode == l.languageCode)
                          const Icon(Icons.check)
                      ],
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
