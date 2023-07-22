import 'package:cash_tab/components/curreny_select_input.dart';
import 'package:cash_tab/managers/rates_manager.dart';
import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/utils.dart';
import 'package:cash_tab/providers/rates_view_search_providers.dart';
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
  void initState() {
    Future.delayed(Duration.zero, () async {
      await onInitState();
    });

    super.initState();
  }

  Future<void> onInitState() async {
    final dbService = await ref.watch(dbServiceProvider.future);
    final items = await dbService.ratesRepository.all();
    final symbolsNotifier = ref.watch(ratesViewSearchResults.notifier);
    symbolsNotifier.setUp(items);
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    final symbols = ref.watch(ratesViewSearchResults);
    final ratesManager = ref.read(ratesManagerProvider);

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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...symbols.map(
                      (rate) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  ratesManager.ratesViewPutSymbol(
                                    widget.index,
                                    rate.symbol,
                                  );
                                  router.go('/');
                                },
                                child: Text(
                                  '${rate.symbol.toUpperCase()} - ${rate.name?.capitalize()}',
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
            )
          ],
        ),
      ),
    );
  }
}
