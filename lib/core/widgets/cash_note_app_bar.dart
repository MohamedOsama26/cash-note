import 'dart:io';

import 'package:cash_note/core/utils/app_colors.dart';
import 'package:flutter/material.dart';


class CashNoteAppBar extends StatelessWidget {
  const CashNoteAppBar(
      {Key? key,
      this.drawerKey,
      this.name,
      this.screenTitle,
      this.items,
      this.profileImage})
      : super(key: key);

  final GlobalKey<ScaffoldState>? drawerKey;
  final String? name;
  final String? profileImage;
  final String? screenTitle;
  final List<Widget>? items;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: FileImage(
              File('path'),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            'Mohamed Osama',
            style: TextStyle(color: AppColors.onBackgroundColor, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
