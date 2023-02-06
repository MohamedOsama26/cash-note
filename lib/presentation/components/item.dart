import 'package:flutter/material.dart';

class HomeListItem extends StatelessWidget {
  const HomeListItem({
    super.key,
    required this.amount,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.listItems,
  });

  final String amount;
  final String date;
  final String title;
  final String subtitle;
  final String type;
  final List<PopupMenuEntry> listItems;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showMenu(
            context: context,
            position: RelativeRect.fromLTRB(
                MediaQuery.of(context).size.width, 0, 0, 0),
            items: listItems);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    type == 'income'
                        ? 'assets/icons/incomeIcon.png'
                        : 'assets/icons/expenseIcon.png',
                    height: 50,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            subtitle,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 17, color: Color(0xff808080)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        amount,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Color(0xff4f6ef4),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'comic'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        date.toString(),
                        style: const TextStyle(
                            fontSize: 16, color: Color(0xff505050)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // String image;
  // if (type == 'income') {
  //   image = 'assets/icons/incomeIcon.png';
  // } else if (type == 'outcome') {
  //   image = 'assets/icons/expenseIcon.png';
  // } else {
  //   image = '';
  // }

}
