import 'package:flutter/material.dart';

Widget sideDrawer({context}) {
  return Drawer(
    child: Container(
      color: const Color(0xffffffff),
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Home Page',
                  style: TextStyle(
                    color: Color(0xff433DF2),
                    fontSize: 23
                  ),
                ),
                onTap: () => Navigator.pushNamedAndRemoveUntil(context,'/', (Route<dynamic> route) => false),
                tileColor: const Color(0xff433DF2),
                leading: const Icon(Icons.home,size: 27,color: Color(0xff433DF2),),
              ),
              Container(
                height: 1,
                color: const Color(0xff433DF2),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              ListTile(
                title: const Text(
                  'Analysis',
                  style: TextStyle(
                    color: Color(0xff433DF2),
                    fontSize: 25
                  ),
                ),
                onTap: () => Navigator.pushNamed(context, '/analyzing'),
                tileColor: const Color(0xff433DF2),
                leading: const Icon(Icons.show_chart,size: 27,color: Color(0xff433DF2),),
              ),
              Container(
                height: 1,
                color: const Color(0xff433DF2),
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
