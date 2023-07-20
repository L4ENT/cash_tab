import 'package:cash_tab/components/bottom_navigation.dart';
import 'package:cash_tab/components/home_currency_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,###.00');

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
                children: const [
                  HomeCurrencyInputWidget(
                    currency: 'USD',
                    index: 0,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  HomeCurrencyInputWidget(
                    currency: 'IDR',
                    index: 1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  HomeCurrencyInputWidget(
                    currency: 'RUB',
                    index: 2,
                  ),
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
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              'RUB',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Text(
                            'USD',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.top,
                          child: Text(
                            'IDR',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
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
