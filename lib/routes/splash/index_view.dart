import 'package:cash_tab/providers/db_provider.dart';
import 'package:cash_tab/providers/settings_providers.dart';
import 'package:cash_tab/seed/currency_rates_seed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    final router = GoRouter.of(context);
    final languageNotifier = ref.read(languageProvider.notifier);
    Future.delayed(Duration.zero, () async {
      await languageNotifier.init();
      final isar = await ref.read(isarProvider.future);
      await seedRatesCollection(isar);
      router.go('/');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo-1024x1024-transparent.png',
          width: 185,
          height: 185,
        ),
      ),
    );
  }
}
