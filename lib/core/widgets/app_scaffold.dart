import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cash_note/core/utils/app_colors.dart';
import 'package:cash_note/core/widgets/cash_note_app_bar.dart';
import 'package:cash_note/features/transactions/presentation/screens/new_transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.pages,
    this.bottomNavBar = true,
    this.floatingActionButton = true,
    this.appBar = true,
    this.change,
  }) : super(key: key);

  final List<Widget> pages;
  final bool bottomNavBar;
  final bool floatingActionButton;
  final bool appBar;
  final Function? change;

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _index = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: widget.floatingActionButton
          ? FloatingActionButton(
              backgroundColor: const Color(0xA3656565),
              elevation: 20,
              shape: const CircleBorder(),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const NewTransactionScreen(),
                //   ),
                // );
                Get.to(()=>const NewTransactionScreen());
              },
              child: const Icon(Icons.add_rounded,
                  color: Color(0xFFFFFFFF),
                  size: 40,
                  shadows: [
                    Shadow(
                        blurRadius: 5,
                        color: Color(0xFFFFFFFF),
                        offset: Offset(1, 1))
                  ]),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: widget.bottomNavBar
          ? AnimatedBottomNavigationBar(
              activeColor: AppColors.onBackgroundColor,
              backgroundColor: const Color(0x6B232323),
              inactiveColor: const Color(0xA3656565),
              icons: const [
                Icons.home_outlined,
                Icons.list_alt_rounded,
                // Icons.bar_chart_rounded,
                // Icons.person_2_outlined
              ],
              activeIndex: _index,
              gapLocation: GapLocation.center,
              onTap: (index) {
                setState(() {
                  _index = index;
                });
                _pageController.animateToPage(_index,
                    duration: const Duration(milliseconds: 80),
                    curve: Curves.linear);
              },
            )
          : null,
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              if (widget.appBar) const CashNoteAppBar(),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _index = page;
                  });
                },
                children: widget.pages,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
