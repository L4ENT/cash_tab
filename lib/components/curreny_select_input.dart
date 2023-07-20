import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencySearchInputWidget extends StatelessWidget {
  const CurrencySearchInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
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
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
    );
  }
}