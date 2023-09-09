import 'package:cash_note/core/utils/app_colors.dart';
import 'package:cash_note/features/balance/presentation/manager/balance_cubit.dart';
import 'package:cash_note/features/balance/presentation/widgets/app_list_tile.dart';
import 'package:cash_note/features/balance/presentation/widgets/today_balance.dart';
import 'package:cash_note/features/transactions/presentation/screens/all_transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_fonts.dart';
import '../../../transactions/presentation/manager/transactions_cubit.dart';
import '../../../transactions/presentation/widgets/transaction_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<BalanceCubit, BalanceState>(
            builder: (context, state) {
              if(state is BalanceSuccess) {
                return Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Balance',
                          style: TextStyle(
                            color: const Color(0x99FFFFFF),
                            fontFamily: AppFonts.nunito(italic: true),
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: AppColors.onBackgroundColor,
                                thickness: 0.5,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text('${state.balance} L.E',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: AppColors.onBackgroundColor,
                                      fontWeight: FontWeight.w400)),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.onBackgroundColor,
                                thickness: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TodayBalance(
                    todayBalance: state.todayBalance,
                    todayExpense: state.todayExpense,
                    todayIncome: state.todayIncome,
                  ),
                ],
              );
              }else{
                BalanceCubit.get(context).balance();
                return SizedBox();
              }
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Last transactions',
                        style: TextStyle(
                            color: AppColors.onBackgroundColor, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<TransactionsCubit, TransactionsState>(
                  builder: (context, state) {
                    if (state is TransactionsSuccess) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      TransactionDialog(
                                          transactionModel:
                                          state.transactions[index]));
                            },
                            child: AppListTile(
                              amount: state.transactions[index].amount,
                              function: (context) {
                                TransactionsCubit.get(context)
                                    .deleteTransaction(
                                    state.transactions[index].id!);
                              },
                              title: state.transactions[index].title,
                              subtitle: state.transactions[index].subtitle,
                              type: state.transactions[index].type,
                              iconData: state.transactions[index].icon,
                              transactionDate:
                              DateFormat.yMMMd().format(state.transactions[index].transactionDate),
                              creationDate:
                              state.transactions[index].createdDate.toString(),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.onBackgroundColor,
                            thickness: 0.2,
                          );
                        },
                        itemCount: state.transactions.length < 4
                            ? state.transactions.length
                            : 4,
                      );
                    } else if (state is TransactionsError) {
                      return Center(
                        child: Text('Nothing'),
                      );
                    } else if (state is TransactionsLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      TransactionsCubit.get(context).transactions();
                      BalanceCubit.get(context).balance();
                      return Text('Hello');
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
