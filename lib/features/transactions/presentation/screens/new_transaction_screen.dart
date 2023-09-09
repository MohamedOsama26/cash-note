import 'package:cash_note/core/utils/app_colors.dart';
import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/core/utils/app_icons.dart';
import 'package:cash_note/features/transactions/data/models/transaction_model.dart';
import 'package:cash_note/features/transactions/presentation/manager/transactions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class NewTransactionScreen extends StatefulWidget {
  const NewTransactionScreen({Key? key}) : super(key: key);

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  int selectedIndex = 1;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _subtitle = TextEditingController();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final TextEditingController _notes = TextEditingController();
  TransactionType _type = TransactionType.income;
  String iconPath = AppIcons.chooseIcon[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'New Transaction',
        ),
        foregroundColor: AppColors.onBackgroundColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _type = TransactionType.expense;
                                    selectedIndex = 0;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/icons/down_arrow.png',
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text('Expense',
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 18)),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2,
                                color: Colors.red,
                                width: selectedIndex == 0 ? null : 0,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _type = TransactionType.income;
                                    selectedIndex = 1;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/up_arrow.png',
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      'Icome',
                                      style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.green,
                                height: 2,
                                width: selectedIndex == 1 ? null : 0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                    controller: _title,
                                    decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(2),
                                        label: Text(
                                          'Title',
                                          style: TextStyle(
                                              color: Color(0x7CFFFFFF),
                                              fontSize: 16),
                                        ),
                                        border: UnderlineInputBorder()),
                                    style: const TextStyle(
                                        color: Color(0xFFFFFFFF)),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: DropdownButtonFormField(
                                    dropdownColor: Color(0xEC2C2C2C),
                                    hint: Image.asset(iconPath),
                                    alignment: Alignment.center,
                                    iconSize: 21,
                                    items: AppIcons.chooseIcon.map((e) {
                                      return DropdownMenuItem(
                                        alignment: Alignment.center,
                                        child: Image.asset(e),
                                        value: e,
                                      );
                                    }).toList(),
                                    onChanged: (icon) {
                                      iconPath = icon ?? iconPath;
                                    },
                                  ),
                                )
                              ],
                            ),
                            TextFormField(
                              controller: _subtitle,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  label: Text(
                                    'Subtitle',
                                    style: TextStyle(
                                        color: Color(0x7CFFFFFF), fontSize: 16),
                                  ),
                                  border: UnderlineInputBorder()),
                              style: const TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                            TextFormField(
                              controller: _amount,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  label: Text(
                                    'Amount',
                                    style: TextStyle(
                                        color: Color(0x7CFFFFFF), fontSize: 16),
                                  ),
                                  border: UnderlineInputBorder()),
                              style: const TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                            TextFormField(
                              controller: _date,
                              keyboardType: TextInputType.datetime,
                              readOnly: true,
                              validator: (text) {
                                if (text == null || text.isNotEmpty) {
                                  return 'Please Enter the date.';
                                }
                                return null;
                              },
                              onTap: () async {
                                DateTime? date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1000),
                                  lastDate: DateTime(3000),
                                );
                                _date.text = DateFormat.yMMMMd().format(date!);
                              },
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(2),
                                  label: Text(
                                    'Date',
                                    style: TextStyle(
                                        color: Color(0x7CFFFFFF), fontSize: 16),
                                  ),
                                  border: UnderlineInputBorder()),
                              style: const TextStyle(color: Color(0xFFFFFFFF)),
                            ),
                            TextFormField(
                              controller: _notes,
                              maxLines: 6,
                              keyboardType: TextInputType.multiline,
                              style: const TextStyle(color: Color(0xFFFFFFFF)),
                              decoration: const InputDecoration(
                                  labelText: 'Notes',
                                  floatingLabelAlignment:
                                  FloatingLabelAlignment.start
                                // label: Text('Notes'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: BlocBuilder<TransactionsCubit, TransactionsState>(
                    builder: (context, state) {
                      return FilledButton(
                        onPressed: () {
                          final date = DateFormat.yMMMMd().parse(_date.text);
                          TransactionsCubit.get(context)
                              .addTransaction(TransactionModel(
                            title: _title.text,
                            icon: iconPath,
                            notes: _notes.text,
                            transactionDate: DateFormat.yMMMMd().parse(_date.text),
                            subtitle: _subtitle.text,
                            createdDate: DateTime.now(),
                            amount: double.parse(_amount.text),
                            type: _type,
                          ));
                          Navigator.pop(context);
                        },
                        child: const Text('Save'),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
