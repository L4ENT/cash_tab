import 'package:cash_tab/components/home_currency_input.dart';
import 'package:cash_tab/managers/rates_manager.dart';
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

  String firstColumnFormat(num num) {
    if (num >= 1000000000) {
      return '${(num / 1000000000).toStringAsFixed(0)}B';
    }
    if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(0)}M';
    }
    if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(0)}K';
    }
    return num.toStringAsFixed(0);
  }

  String otherColumnsFormat(num num) {
    final formatter = NumberFormat('#,##0.00');
    return formatter
        .format(num)
        .toString()
        .replaceAll(',', ' ')
        .replaceAll('.', ',');
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    List<String> rates = ref.watch(ratesViewInputListProvider);
    final ratesRatio = ref.watch(ratesRatioProvider);

    final theme = Theme.of(context);
    final inFavoritesAsync = ref.watch(inFavoritesDbProvider);

    final ratesManager = ref.read(ratesManagerProvider);

    final scraperLoading = ref.watch(scrapperLoadingProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          rates.join(' / '),
          style: theme.textTheme.titleLarge,
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await ratesManager.ratesViewAddToFavorites();
            },
            icon: Icon(
              // inFavorites ? Icons.bookmark : Icons.bookmark_outline,
              inFavoritesAsync.when(
                data: (flag) => flag ? Icons.bookmark : Icons.bookmark_outline,
                error: (error, _) => Icons.bookmark_outline,
                loading: () => Icons.bookmark_outline,
              ),
              color: theme.primaryColor,
            ),
          )
        ],
      ),
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
              if (scraperLoading != null)
                Material(
                  elevation: 8.0,
                  color: Colors.transparent,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 15.0,
                          height: 15.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text('Loading $scraperLoading from internet'),
                      ],
                    ),
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
                                        .titleMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        ...generateBanknotes(ratesMap[rates[0]]).map(
                          (i) {
                            return TableRow(
                              children: [
                                ...rates.asMap().entries.map(
                                  (e) {
                                    final value = i *
                                        (ratesMap[rates[0]] /
                                            ratesMap[rates[e.key]]);
                                    return TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.top,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: Text(
                                          e.key == 0
                                              ? firstColumnFormat(value)
                                              : otherColumnsFormat(value),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
