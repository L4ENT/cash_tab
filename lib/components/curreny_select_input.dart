import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/rates_view_search_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencySearchInputWidget extends ConsumerWidget {
  const CurrencySearchInputWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) async {
        if (value.length >= 3) {
          final dbProvider = await ref.watch(dbServiceProvider.future);
          final items = await dbProvider.ratesRepository.search(value);
          final symbolsNotifier = ref.watch(ratesViewSearchResults.notifier);
          symbolsNotifier.setUp(items);
        } else {
          final dbProvider = await ref.watch(dbServiceProvider.future);
          final items = await dbProvider.ratesRepository.all();
          final symbolsNotifier = ref.watch(ratesViewSearchResults.notifier);
          symbolsNotifier.setUp(items);
        }
      },
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!
            .currency_search_placeholder
            .capitalize(),
        suffixIcon: GestureDetector(
          onTap: () => {},
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
