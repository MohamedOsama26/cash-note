import 'package:cash_note/core/utils/app_fonts.dart';
import 'package:cash_note/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'features/balance/presentation/manager/balance_cubit.dart';
import 'features/transactions/presentation/manager/transactions_cubit.dart';

class CashNoteApp extends StatelessWidget {
  const CashNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransactionsCubit(),
          ),
          BlocProvider(
            create: (context) => BalanceCubit(),
          ),
        ],
        child: GetMaterialApp(
          home: MaterialApp(
              themeMode: ThemeMode.dark,
              theme: ThemeData(
                colorSchemeSeed: const Color(0xFF858080),
                useMaterial3: true,
                fontFamily: AppFonts.nunito(),
              ),
              home: const MainPageView()),
        ));
  }
}
