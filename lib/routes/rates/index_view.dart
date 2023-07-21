import 'package:cash_tab/components/home_currency_input.dart';
import 'package:cash_tab/providers/rates_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class RatesView extends ConsumerStatefulWidget {
  const RatesView({super.key, required this.title});

  final String title;

  @override
  RatesViewState createState() => RatesViewState();
}

class RatesViewState extends ConsumerState<RatesView> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###.00');
    List<String> rates = ref.watch(ratesViewInputListProvider);
    final ratesRatio = ref.watch(ratesRatioProvider);

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        rates.join(' / '),
                        style: theme.textTheme.headlineSmall,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    IconButton(
                      // TODO: Add this setup to favorites
                      onPressed: () => {},
                      icon: Icon(
                        // TODO: Favorites flag
                        true ? Icons.bookmark : Icons.bookmark_outline,
                        color: theme.colorScheme.primary,
                      ),
                    )
                  ],
                ),
              ),
              // Add your scrollable content here
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    ...rates.asMap().entries.map(
                          (e) => Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: HomeCurrencyInputWidget(
                              currency: e.value,
                              index: e.key,
                            ),
                          ),
                        ),
                    IconButton(
                      onPressed: () => {
                        // TODO: Open search view
                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: ratesRatio.when(
                    loading: () => const CircularProgressIndicator(),
                    error: (err, stack) => Text('Error: $err'),
                    data: (ratesMap) {
                      return Table(
                        children: [
                          TableRow(
                            children: [
                              ...rates.map(
                                (el) => TableCell(
                                  verticalAlignment:
                                      TableCellVerticalAlignment.top,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Text(
                                      el,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          // TODO: Вставить массив номиналов
                          ...[100, 500, 1000, 5000, 10000].map(
                            (i) => TableRow(
                              children: [
                                ...rates.asMap().entries.map(
                                  (e) {
                                    return TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Text(
                                          formatter
                                              .format(
                                                i *
                                                    (ratesMap[rates[
                                                            e.key - 1 > 0
                                                                ? e.key - 1
                                                                : 0]] /
                                                        ratesMap[rates[e.key]]),
                                              )
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  )),
              // Add more widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
