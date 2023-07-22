import 'package:cash_tab/providers/settings_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:cash_tab/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class AppearanceSettingsView extends ConsumerStatefulWidget {
  const AppearanceSettingsView({super.key, required this.title});

  final String title;

  @override
  AppearanceSettingsViewState createState() => AppearanceSettingsViewState();
}

class AppearanceMenuItem {
  AppearanceMenuItem({required this.title, required this.widget});

  String title;
  Widget widget;
}

class AppearanceSettingsViewState
    extends ConsumerState<AppearanceSettingsView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final darkTheme = ref.watch(darkThemeProvider);
    final darkThemeNotifier = ref.watch(darkThemeProvider.notifier);

    final menuItems = [
      AppearanceMenuItem(
        title: l10n!.dark_mode.capitalize(),
        widget: Checkbox(
          value: darkTheme,
          onChanged: (value) {
            darkThemeNotifier.set(value!);
          },
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: Text(widget.title.capitalize())),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: ListView.separated(
          itemCount: menuItems.length,
          separatorBuilder: (context, index) => const Divider(
            height: 1, // Customize the color of the separator here
          ),
          itemBuilder: (context, index) => ListTile(
            title: Text(menuItems[index].title),
            trailing: menuItems[index].widget,
          ),
        ),
      ),
    );
  }
}
