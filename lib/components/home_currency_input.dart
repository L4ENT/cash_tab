import 'package:cash_tab/providers/rates_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final intSelectionIndex = newValue.selection.end;
    String formattedText = formatNumberWithSpaces(newValue.text);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(
          offset: intSelectionIndex +
              (formattedText.length - newValue.text.length)),
    );
  }
}

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
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        final value = safeParseDouble(textController.text);
        if (value == 0) {
          textController.text = '';
        }
      } else {
        final value = safeParseDouble(textController.text);
        if (value == 0) {
          textController.text = '0.0';
        }
      }
    });
  }

  @override
  void dispose() {
    textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final router = GoRouter.of(context);

    final value = ref.watch(rateViewInputFamily(widget.currency));
    final inputsManager = ref.watch(ratesInputsEditProvider);
    textController.text = formatNumberWithSpaces(value.toString());

    final ratesListNotifier = ref.watch(ratesViewInputListProvider.notifier);

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: textController,
            focusNode: _focusNode,
            onChanged: (value) {
              try {
                final doubleValue = double.parse(value.replaceAll(' ', ''));
                inputsManager.onInputChange(widget.currency, doubleValue);
              } catch (e) {}
            },
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              CustomNumberTextInputFormatter()
            ],
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
          ),
        ),
        const SizedBox(width: 16),
        TextButton.icon(
          onPressed: () => {
            router.push('/currency/select/${widget.index}'),
          },
          icon: const Icon(Icons.arrow_drop_down),
          label: Text(widget.currency),
        ),
        if (widget.index > 1)
          Row(
            children: [
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => {ratesListNotifier.remove(widget.currency)},
                child: const Icon(Icons.remove_circle),
              ),
            ],
          ),
        if (widget.index > 0)
          Row(
            children: [
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () => {ratesListNotifier.up(widget.currency)},
                child: const Icon(Icons.arrow_upward),
              ),
            ],
          ),
      ],
    );
  }
}
