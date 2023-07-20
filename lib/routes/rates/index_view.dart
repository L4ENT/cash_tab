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
    final ratesViewInputListProviderNotifier = ref.read(
      ratesViewInputListProvider.notifier,
    );
    List<String> rates = ref.watch(ratesViewInputListProvider);
    // TODO: подтягивать реальные рейты
    const rate1 = 0.011;
    const rate2 = 165.16;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                      'USD / RUB / IDR',
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
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        ...['USD', 'EUR', 'RUB'].map(
                          (el) => TableCell(
                            verticalAlignment: TableCellVerticalAlignment.top,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                el,
                                style: Theme.of(context).textTheme.titleLarge,
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
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.top,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                formatter.format(i).toString(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.top,
                            child: Text(
                              formatter.format(i * rate1),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.top,
                            child: Text(
                              formatter.format(i * rate2),
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
            // Add more widgets as needed
          ],
        ),
      ),
    );
  }
}
