import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_provider.dart';
import '../../consts/app_colors.dart';
import '../bottom_sheet/add_task_bottom_sheet.dart';

class FloatingActionBtn extends StatelessWidget {
  const FloatingActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(
            color: themeProvider.isDark
                ? AppColors.secondaryDarkColor
                : Colors.white,
            width: 3),
      ),
      backgroundColor: AppColors.customBlue,
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: themeProvider.isDark? AppColors.secondaryDarkColor : null,
          isDismissible: false,
          isScrollControlled: false,
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.only(bottom: 20, left: 20.0, right: 20.0),
            //height: size.height * .75,
            width: double.infinity,
            child: const AddTaskBottomSheet(),
          ),
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30.0,
      ),
    );
  }
}
