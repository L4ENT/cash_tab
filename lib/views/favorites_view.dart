import 'package:cash_tab/components/favorites_search_input.dart';
import 'package:cash_tab/components/favorites_sort_dropdown.dart';
import 'package:cash_tab/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key, required this.title});

  final String title;

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title.capitalize())),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Expanded(child: FavoritesSearchInputWidget()),
                SizedBox(width: 24),
                FavoritesSortDropdown()
              ],
            ),
            const SizedBox(height: 32),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // TODO: Get real favorites list
                children: [
                  ...['USD / RUB / IDR', 'USD / RUB', 'BTC / USD / RUB'].map(
                    (name) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          GestureDetector(
                            child: const Icon(Icons.arrow_circle_right),
                            onTap: () => {
                              // TODO: Navigate to home view
                              // 1. Change state of home View (list of currencies)
                              // 2. Go router
                            },
                          )
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
