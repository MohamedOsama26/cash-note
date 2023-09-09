import 'package:cash_note/core/utils/app_colors.dart';
import 'package:cash_note/features/balance/presentation/manager/balance_cubit.dart';
import 'package:cash_note/features/transactions/presentation/widgets/transaction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../balance/presentation/widgets/app_list_tile.dart';
import '../manager/transactions_cubit.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({Key? key}) : super(key: key);

  @override
  State<AllTransactions> createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.onBackgroundColor,
        title: const Text('Transactions'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: BlocBuilder<TransactionsCubit, TransactionsState>(
            builder: (context, state) {
          if (state is TransactionsSuccess) {
            return ListView.separated(
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => TransactionDialog(
                            transactionModel: state.transactions[index],
                          ));
                },
                child: AppListTile(
                  amount: state.transactions[index].amount,
                  function: (context) {
                    TransactionsCubit.get(context)
                        .deleteTransaction(state.transactions[index].id!);
                  },
                  id: state.transactions[index].id,
                  title: state.transactions[index].title,
                  subtitle: state.transactions[index].subtitle,
                  type: state.transactions[index].type,
                  iconData: state.transactions[index].icon,
                  creationDate: state.transactions[index].createdDate.toString(),
                  transactionDate: DateFormat.yMMMd().format(state.transactions[index].transactionDate),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
              itemCount: state.transactions.length,
            );
          } else if (state is TransactionsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionsError) {
            return Center(
              child: Column(children: [
                Text(
                  'Error',
                  style: TextStyle(
                      color: AppColors.onBackgroundColor, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      TransactionsCubit.get(context).transactions();
                      BalanceCubit.get(context).balance();
                    },
                    child: Text('Try again'))
              ]),
            );
          } else {
            TransactionsCubit.get(context).transactions();
            return Center(
              child: Text(
                'Hello',
                style:
                    TextStyle(color: AppColors.onBackgroundColor, fontSize: 40),
              ),
            );
          }
        }),
      ),
    );
  }
}
