import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/consts/app_colors.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/widgets/task_item_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: Stack(
            //alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 70,
                color: AppColors.customBlue,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6.0, top: 20),
                child: DatePicker(
                  DateTime.now(),
                  unSelectionColor: themeProvider.isDark? AppColors.secondaryDarkColor : Colors.white,
                  selectionColor: AppColors.customBlue,
                  selectedTextColor: Colors.white,
                  initialSelectedDate: DateTime.now(),
                  locale: "en",
                  height: 95,
                  dateTextStyle: TextStyle(color: themeProvider.isDark? Colors.white : null),
                  dayTextStyle: TextStyle(color: themeProvider.isDark? Colors.white : null),
                  monthTextStyle: TextStyle(color: themeProvider.isDark? Colors.white : null),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView.separated(
              itemBuilder: (context, index) => const TaskItemWidget(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 18.0,
              ),
              itemCount: 20,
            ),
          ),
        ),
      ],
    );
  }
}
