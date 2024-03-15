import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icons_flutter/icons_flutter.dart';
import '../consts/app_colors.dart';

class TaskItemWidget extends StatelessWidget {
   const TaskItemWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      startActionPane: ActionPane(
        extentRatio: .55,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (context){},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.horizontal(left: Radius.circular(12.0)),
          ),
          SlidableAction(
            onPressed: (context){},
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: IconlyLight.edit,
            label: 'Edit',
            borderRadius: BorderRadius.horizontal(right: Radius.circular(12.0)),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        height: 115,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VerticalDivider(
              color: AppColors.customBlue,
              thickness: 4,
              endIndent: 6,
              indent: 6,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Play basket ball",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0,
                      color: AppColors.customBlue),
                ),
                const Row(
                  children: [
                    Icon(IconlyLight.discovery),
                    Text(
                      "10:30 AM",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.customBlue,
                ),
                child: const Icon(
                  FontAwesome5Icon.check,
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
