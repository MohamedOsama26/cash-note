import 'package:cash_note/core/utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/utils/app_fonts.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.iconData,
    required this.transactionDate,
  required this.creationDate,
     this.id,
    this.function,
    required this.amount,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final TransactionType type;
  final String iconData;
  final String transactionDate;
  final String creationDate;
  final int? id;
  final double amount;
  final void Function(BuildContext context)? function;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // The end action pane is the one at the right or the bottom side.
      startActionPane:  ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            padding: EdgeInsets.zero,
            onPressed: function,
            backgroundColor: Colors.transparent,
            foregroundColor: const Color(0xFFFF0000),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.mirror,
              colors: [
                Color(0x22FFFFFF),
                Color(0x51464646),
              ]),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title:  Text(
          title,
          style: TextStyle(
            color: Color(0x81FFFFFF),
            fontSize: 20,
          ),
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: const Color(0x0aafffff),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(iconData),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: TextStyle(
                color: const Color(0x54FFFFFF),
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontFamily: AppFonts.nunito(italic: true),
              ),
            ),
            Text(
              '${amount} L.E',
              style: TextStyle(
                color: const Color(0xFFFFFFFF),
                fontSize: 16,
                fontStyle: FontStyle.italic,
                fontFamily: AppFonts.nunito(italic: true),
              ),
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              type == TransactionType.expense?'assets/icons/down_arrow.png':'assets/icons/up_arrow.png',
              width: 40,
            ),
            Text(transactionDate,style: TextStyle(
                color: const Color(0x54FFFFFF),
        fontSize: 12,
        height: 2,
        fontStyle: FontStyle.italic,
        fontFamily: AppFonts.nunito(italic: true),
      ),),
          ],
        ),
      ),
    ),
    );

  }
}
