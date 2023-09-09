import 'package:cash_note/core/widgets/app_scaffold.dart';
import 'package:cash_note/features/statistics/presentation/screens/statistics_screen.dart';
import 'package:cash_note/features/transactions/presentation/screens/all_transactions.dart';
import 'package:flutter/material.dart';

import 'features/balance/presentation/screens/home_screen.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key,}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      appBar: false,
        pages: [
          HomeScreen(),
          AllTransactions(),
          // StatisticsScreen(),
        ],
    );
  }
}
