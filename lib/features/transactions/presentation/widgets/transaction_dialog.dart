import 'package:cash_note/core/utils/app_colors.dart';
import 'package:cash_note/features/transactions/data/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/app_icons.dart';

class TransactionDialog extends StatelessWidget {
  const TransactionDialog({Key? key, required this.transactionModel})
      : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Dialog(
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x62FFFFFF))),
            insetPadding: EdgeInsets.all(30),
            backgroundColor: Color(0xFF000000),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    transactionModel.type.name,
                    style: TextStyle(
                        color: AppColors.onBackgroundColor, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0x0aafffff),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(transactionModel.icon),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactionModel.title,
                              style: TextStyle(
                                color: AppColors.onBackgroundColor,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              transactionModel.subtitle,
                              style: TextStyle(
                                color: Color(0x94FFFFFF),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                        DateFormat.yMMMd().format(transactionModel.transactionDate),
                        style: TextStyle(color: Color(0x55FFFFFF))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${transactionModel.amount} L.E.',
                      style: TextStyle(
                        color: AppColors.onBackgroundColor,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (transactionModel.notes != '')
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SelectableText(
                        textAlign: TextAlign.left,
                        transactionModel.notes,
                        style: TextStyle(color: Color(0x99FFFFFF)),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Close',
                      ),
                      style: ButtonStyle(
                          foregroundColor: MaterialStatePropertyAll(
                              AppColors.onBackgroundColor)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
