import 'package:cash_tab/providers/rates_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeCurrencyInputWidget extends ConsumerStatefulWidget {
  const HomeCurrencyInputWidget({
    super.key,
    required this.currency,
    required this.index,
  });

  final String currency;
  final int index;

  @override
  HomeCurrencyInputState createState() => HomeCurrencyInputState();
}

class HomeCurrencyInputState extends ConsumerState<HomeCurrencyInputWidget> {
  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final router = GoRouter.of(context);

    final value = ref.watch(rateViewInputFamily(widget.currency));
    final inputsManager = ref.watch(ratesInputsEditProvider);
    textController.text = value.toString();

    return TextField(
      controller: textController,
      onChanged: (value) {
        try {
          final doubleValue = double.parse(value);
          inputsManager.onInputChange(widget.currency, doubleValue);
        } catch (e) {}
      },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: l10n.enter_amount_placeholder.capitalize(),
        suffixIcon: GestureDetector(
          onTap: () => {
            router.push('/currency/select/${widget.index}'),
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.currency,
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
