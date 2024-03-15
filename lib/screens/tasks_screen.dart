import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/consts/app_colors.dart';
import 'package:todo/widgets/task_item_widget.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0,top: 20),
                  child: DatePicker(
                    DateTime.now(),
                    selectionColor: Colors.white,
                    selectedTextColor: Colors.black,
                    initialSelectedDate: DateTime.now(),
                    locale: "en",
                    height: 95,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView.separated(
              itemBuilder: (context, index) =>  const TaskItemWidget(),
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
