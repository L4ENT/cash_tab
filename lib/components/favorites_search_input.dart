import 'package:cash_tab/managers/favorites_manager.dart';
import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/favorites_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesSearchInputWidget extends ConsumerWidget {
  const FavoritesSearchInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesManager = ref.read(favoritesManagerProvider);
    return TextField(
      onChanged: (String value) async {
        await favoritesManager.updateViewList(prompt: value);
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.enter_the_value.capitalize(),
        suffixIcon: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.search),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
