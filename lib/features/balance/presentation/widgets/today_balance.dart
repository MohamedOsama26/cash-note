import 'package:flutter/material.dart';

class TodayBalance extends StatelessWidget {
  const TodayBalance({
    Key? key,
    required this.todayBalance,
    required this.todayExpense,
    required this.todayIncome,
  }) : super(key: key);

  final double todayBalance;
  final double todayExpense;
  final double todayIncome;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 18.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0x5ABEBEBE),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Today's balance",
                      style: TextStyle(color: Color(0xD8FFFFFF), fontSize: 18),
                    ),
                    Text(
                      '$todayBalance L.E',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0x80000000)),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward_rounded,
                        color: Color(0xFF00FF00), size: 28.0),
                    Text(
                      '$todayIncome',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
                    ),
                    Spacer(),
                    Text(
                      'L.E',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 4.0),
                height: 1,
                decoration: BoxDecoration(
                  // color: Color(0xFFFFFFFF),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFFFFFFF), blurRadius: 2)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color(0x80000000),
                ),
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_downward_rounded,
                        color: Color(0xFFFF0000), size: 28.0),
                    Text(
                      '$todayExpense',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
                    ),
                    Spacer(),
                    Text(
                      'L.E',
                      style:
                          TextStyle(color: Color(0xFFFFFFFF), fontSize: 20.0),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
