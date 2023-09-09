import 'package:cash_note/core/utils/app_colors.dart';
import 'package:cash_note/features/statistics/presentation/manager/statistics_controller.dart';
import 'package:cash_note/features/statistics/presentation/widgets/monthly_saving_money_chart.dart';
import 'package:cash_note/features/statistics/presentation/widgets/week_transactions_chart.dart';
import 'package:flutter/material.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0,top: 12),
            child: Text(
              'Week Transactions',
              style: TextStyle(color: AppColors.onBackgroundColor,fontSize: 16),
            ),
          ),
          WeekTransactionsChart(),
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text('Monthly Saving Money',style: TextStyle(color: AppColors.onBackgroundColor,fontSize: 16),),
          ),
          MonthlySavingMoneyChart(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: Text('Saving Rate = 30%',style: TextStyle(color: AppColors.onBackgroundColor,fontSize: 24.0),),
          ),
          SizedBox(height: 20,),
          TextButton(onPressed: (){
            StatisticsController().collectWeekTransactions();
          }, child: Text('Print'))
        ],
      ),
    );
  }
}
