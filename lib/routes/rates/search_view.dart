import 'package:cash_tab/components/curreny_select_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CurrencySelectView extends ConsumerStatefulWidget {
  const CurrencySelectView({
    super.key,
    required this.index,
  });

  final int index;

  @override
  CurrencySearchViewState createState() => CurrencySearchViewState();
}

class CurrencySearchViewState extends ConsumerState<CurrencySelectView> {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(child: CurrencySearchInputWidget()),
              ],
            ),
            const SizedBox(height: 32),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO: Get the real list from data source
                children: [
                  ...[
                    'USD - United States Dollar',
                    'IDR - Indonesian Rupiah',
                    'RUB - Russian ruble',
                  ].map(
                    (name) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => {
                                // TODO: Set the currency code to main state
                                router.go('/')
                              },
                              child: Text(
                                name,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
