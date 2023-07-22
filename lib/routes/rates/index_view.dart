import 'package:cash_tab/components/home_currency_input.dart';
import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/rates_providers.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quiver/iterables.dart';

class RatesView extends ConsumerStatefulWidget {
  const RatesView({super.key, required this.title});

  final String title;

  @override
  RatesViewState createState() => RatesViewState();
}

class RatesViewState extends ConsumerState<RatesView> {
  List<int> generateBanknotes(double usdPrice) {
    final List<int> result = [];
    final List<double> usdAmounts = [
      0.1,
      0.5,
      1,
      5,
      10,
      20,
      50,
      100,
      1000,
      5000,
      10000,
      50000,
    ];
    final List<double> banknotes = [
      1,
      5,
      10,
      20,
      50,
      100,
      500,
      1000,
      2000,
      5000,
      10000,
      50000,
      100000,
      200000,
      500000,
      1000000,
      2000000,
      5000000,
      10000000,
      100000000,
      500000000,
    ];
    for (var usdAmount in usdAmounts) {
      final bPairs = zip([
        banknotes.sublist(0, banknotes.length - 1),
        banknotes.sublist(1),
      ]);
      for (var bPair in bPairs) {
        final value = usdAmount / usdPrice;
        final left = bPair[0];
        final right = bPair[1];
        if (left <= value && value <= right) {
          final banknote = closestTo(value, left, right).toInt();
          if (!result.contains(banknote)) {
            result.add(banknote);
            break;
          }
        }
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final formatter = NumberFormat('#,##0.00');
    List<String> rates = ref.watch(ratesViewInputListProvider);
    final ratesRatio = ref.watch(ratesRatioProvider);

    final theme = Theme.of(context);
    final inFavoritesAsync = ref.watch(inFavoritesDbProvider);

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
                      onPressed: () async {
                        final db = await ref.read(dbServiceProvider.future);
                        final notifier = ref.read(faviriteTriigger.notifier);
                        final flag =
                            await db.favoritesRepository.isFavorites(rates);

                        if (flag) {
                          await db.favoritesRepository.remove(rates);
                        } else {
                          await db.favoritesRepository.add(rates);
                        }
                        notifier.state = !notifier.state;
                      },
                      icon: Icon(
                        // inFavorites ? Icons.bookmark : Icons.bookmark_outline,
                        inFavoritesAsync.when(
                          data: (flag) =>
                              flag ? Icons.bookmark : Icons.bookmark_outline,
                          error: (error, _) => Icons.bookmark_outline,
                          loading: () => Icons.bookmark_outline,
                        ),
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
                        router.push('/currency/select/${rates.length}'),
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
                          ...generateBanknotes(ratesMap[rates[0]]).map(
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
                                                    (ratesMap[rates[0]] /
                                                        ratesMap[rates[e.key]]),
                                              )
                                              .toString()
                                              .replaceAll(',', ' ')
                                              .replaceAll('.', ','),
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
