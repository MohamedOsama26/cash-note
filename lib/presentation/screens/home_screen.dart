import 'package:cash_note/logic/services/calculations_service.dart';
import 'package:flutter/material.dart';

import '../../logic/model/item_data_model.dart';
import '../../logic/repository/data_repository.dart';
import '../components/drawer.dart';
import '../components/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DataRepository db = DataRepository();
  CalculationsService calc = CalculationsService();
  late List<Item> itemsList;
  late List<Item> listOfItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: sideDrawer(
        context: context,
      ),
      body: Stack(children: [
        SizedBox(
          height: double.maxFinite,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                color: const Color(0xff4f6ef4),
                width: double.infinity,
              ),
              Expanded(
                child: FutureBuilder(
                  future: db.readItems(sort: 'DESC'),
                  builder: (BuildContext futureBuilderContext,
                      AsyncSnapshot<List<Item>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 65, bottom: 10),
                        itemCount: snapshot.data?.length,
                        itemBuilder:
                            (BuildContext itemBuilderContext, int index) {
                          return HomeListItem(
                            date: snapshot.data![index].creationDate,
                            type: snapshot.data![index].type,
                            title: snapshot.data![index].title,
                            amount: calc
                                .handleNumber(snapshot.data![index].amount),
                            subtitle: snapshot.data![index].subTitle??'',
                            listItems: [
                              PopupMenuItem(
                                child: GestureDetector(
                                  child: const Text('delete'),
                                  onTap: () {
                                    // db.removeItems(int.parse(
                                    // (snapshot.data![index].id)
                                    //     .toString()));
                                    // setState(() {});
                                    // Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            'Sorry there something went wrong \n ${snapshot.error}'),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        //front side of screen which has menu button and counters counters
        FutureBuilder(
          future: db.readItems(),
          builder: (BuildContext futureBuilderContext,
              AsyncSnapshot<List<Item>> snapshot) {
            if (snapshot.hasData) {
              double incomeSum =
                  IncomeCalculationService().listSum(snapshot.data!);
              double expenseSum =
                  ExpenseCalculationsService().listSum(snapshot.data!);
              double balance = incomeSum - expenseSum;
              print('income sum : $incomeSum');
              print('expense sum : $expenseSum');

              return Column(
                children: [
                  SafeArea(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: GestureDetector(
                            child: const Icon(
                              Icons.menu,
                              size: 40,
                              color: Color(0xffffffff),
                            ),
                            onTap: () {
                              Scaffold.of(futureBuilderContext).openDrawer();
                            }),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x22000000),
                                    offset: Offset(-2, 2),
                                    blurRadius: 5),
                              ]),
                          child: Column(
                            children: [
                              const Text(
                                'EXPENSE',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    calc.handleNumber(expenseSum),
                                    style: const TextStyle(
                                        color: Color(0xff4f6ef4),
                                        fontSize: 35,
                                        fontFamily: 'agency',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'EGP',
                                    style: TextStyle(
                                        fontFamily: 'agency',
                                        fontSize: 20,
                                        color: Color(0xff4f6ef4)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0x22000000),
                                    offset: Offset(-2, 2),
                                    blurRadius: 5),
                              ]),
                          child: Column(
                            children: [
                              const Text(
                                'INCOME',
                                style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    calc.handleNumber(incomeSum),
                                    style: const TextStyle(
                                        color: Color(0xff4f6ef4),
                                        fontSize: 35,
                                        fontFamily: 'agency',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Text(
                                    'EGP',
                                    style: TextStyle(
                                        fontFamily: 'agency',
                                        fontSize: 20,
                                        color: Color(0xff4f6ef4)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x22000000),
                              offset: Offset(-2, 2),
                              blurRadius: 5),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  'Balance',
                                  style: TextStyle(
                                      color: Color(0xff333333),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22,
                                      fontFamily: 'comic'),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          calc.handleNumber(balance),
                                          style: const TextStyle(
                                              color: Color(0xff4f6ef4),
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'agency'),
                                          textAlign: TextAlign.start,
                                        ),
                                        const Text(
                                          'EGP',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontFamily: 'agency',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/newItem');
                          },
                          backgroundColor: const Color(0xff4f6ef4),
                          child: const Icon(
                            Icons.add,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ]),
    );
  }
}
