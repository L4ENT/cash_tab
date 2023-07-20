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
              child: Text(
                'USD / RUB / IDR',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
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
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  HomeCurrencyInputWidget(
                    currency: 'IDR',
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  HomeCurrencyInputWidget(
                    currency: 'RUB',
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'Language',
          ),
        ],
        currentIndex: 0,
        onTap: (index) => {},
      ),
    );
  }
}
