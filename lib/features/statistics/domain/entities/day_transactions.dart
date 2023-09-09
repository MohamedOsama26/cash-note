// // class WeekTransactions {
// //   final double sunIncome;
// // }
//
// import 'package:flutter/material.dart';
//
// class M extends StatefulWidget {
//
//   @override
//   State<M> createState() => _MState();
// }
//
// class _MState extends State<M> {
//   final GlobalKey<FormState> _key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ,
//         title: ,
//
//       ),
//       bottomNavigationBar: BottomNavigationBar(),
//       body: Column(
//         children: [
//           Text(data),
//           Stack(fit: StackFit.,),
//           Container(),
//           ListView(children: [],shrinkWrap: ,),
//           Form(key: _key,child: Column(children: [
//             TextFormField(
//               key: _key,
//               validator: ,
//               textInputAction: TextInputAction.next,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ]),),
//         ],
//       ),
//       backgroundColor:
//
//     );
//   }
// }
//
// abstract class m {
//   m({required this.h});
//
//   final String h;
// }
//
// class d extends m{
//
//   d({required String h}):super(h: h);
//
// }
//
// final obj = d(h: '');

import 'package:cash_note/core/utils/app_enum.dart';
import 'package:cash_note/features/balance/data/models/transaction_model.dart';
import 'package:cash_note/features/statistics/domain/entities/value.dart';

abstract class DayTransactions {

  DayTransactions({required this.date,required this.amount,required this.type,});

  final DateTime date;
  final double amount;
  final TransactionType type;
}