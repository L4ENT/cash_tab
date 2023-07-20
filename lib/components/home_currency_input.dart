import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCurrencyInputWidget extends StatelessWidget {
  const HomeCurrencyInputWidget({
    super.key,
    required this.currency,
    required this.index,
  });

  final String currency;
  final int index;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final router = GoRouter.of(context);

    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: l10n.enter_amount_placeholder.capitalize(),
        suffixIcon: GestureDetector(
          onTap: () => {
            router.push('/currency/select/$index'),
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  currency,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_drop_down),
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
