import 'package:flutter/material.dart';

import '../../constants/enums.dart';
import '../../logic/model/item_data_model.dart';
import '../../logic/repository/data_repository.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({Key? key}) : super(key: key);
  @override
  _NewItemScreenState createState() => _NewItemScreenState();
}

class _NewItemScreenState extends State<NewItemScreen> {
  final _formKey = GlobalKey<FormState>();

  late DataRepository db = DataRepository();

  final _title = TextEditingController();
  final _subTitle = TextEditingController();
  final _amount = TextEditingController();
  String _typeString = ItemType.income.toString().split('.').last;
  ItemType? _type = ItemType.income;
  final _date = TextEditingController();
  late Item newItem;
  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    db.initDB().whenComplete(()async{
      items = await db.readItems();
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff4f6ef4),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Container(
            height: MediaQuery.of(context).size.height - 50,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              color: Color(0xffffffff),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xa6454545), width: 5),
                      ),
                    ),
                    child: const Text(
                      'ADD NEW ITEM',
                      style: TextStyle(color: Color(0xa4454545), fontSize: 30),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title:
                                const Text('Income', style: TextStyle(fontSize: 20)),
                            leading: Radio<ItemType>(
                              value: ItemType.income,
                              groupValue: _type,
                              onChanged: (value) {
                                setState(() {
                                  _type = value;
                                  _typeString =
                                      value.toString().split('.').last;
                                });
                              },
                              activeColor: const Color(0xff4f6ef4),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: const Text(
                              'Expenditure',
                              style: TextStyle(fontSize: 20),
                            ),
                            leading: Radio<ItemType>(
                              value: ItemType.expenditure,
                              groupValue: _type,
                              onChanged: (value) {
                                setState(() {
                                  _type = value;
                                  _typeString =
                                      value.toString().split('.').last;
                                });
                              },
                              activeColor: const Color(0xff4f6ef4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xd5000000),
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          fontSize: 20,
                        ),
                        focusColor: Color(0xff4f6ef4),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff4f6ef4), width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'Enter the item title',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff4f6ef4), width: 0.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffff0000),
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xd5000000),
                      ),
                      controller: _subTitle,
                      decoration: const InputDecoration(
                        labelText: 'Subtitle',
                        focusColor: Color(0xff4f6ef4),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff4f6ef4), width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'Enter the subtitle',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff4f6ef4), width: 0.5),
                        ),
                      ),
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _amount,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xd5000000),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(signed: true),
                      decoration: const InputDecoration(
                        labelText: 'Amount',
                        focusColor: Color(0xff4f6ef4),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff4f6ef4), width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        hintText: 'Enter amount of money',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff4f6ef4), width: 0.5),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffff0000),
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        final number = num.tryParse(value!);

                        if (value.isEmpty || number == null) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xd5000000),
                        ),
                        controller: _date,
                        keyboardType: TextInputType.datetime,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Color(0xff4f6ef4),
                            size: 20,
                          ),
                          labelText: 'Date',
                          focusColor: Color(0xff4f6ef4),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xff4f6ef4), width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          hintText: 'Enter amount of money',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff4f6ef4), width: 0.5),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffff0000),
                            ),
                          ),
                        ),
                        readOnly: true,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now());
                          _date.text = date.toString().substring(0, 10);
                        }),
                  ),

                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //====================== Submit
                        ElevatedButton(
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  side: const BorderSide(
                                    width: 2,
                                    color: Color(0xff4f6ef4),
                                  ),
                                ),
                              ),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 20),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xff4f6ef4),
                              ),
                            ),
                            child: const Text('Submit'),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                db.insertItem(
                                  title: _title.text,
                                  subTitle: _subTitle.text,
                                  type: _typeString,
                                  amount: double.parse(_amount.text),
                                  creationDate: _date.text,
                                );

                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/',
                                  (route) => false,
                                );
                              }
                            }),

                        ElevatedButton(
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xff4f6ef4),
                                ),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20,
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xffffffff),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Color(0xff4f6ef4)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
