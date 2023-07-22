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
    return TextField(
      onChanged: (String value) async {
        final sortState = ref.read(favoritesSortState);
        final db = await ref.read(dbServiceProvider.future);
        final listNotifier = ref.read(favoritesSearchResults.notifier);

        if (value.length > 2) {
          final items = await db.favoritesRepository.search(value);
          listNotifier.setUp(items);
        } else {
          final items = await db.favoritesRepository.all(sort: sortState);
          listNotifier.setUp(items);
        }
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
