import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:todo/consts/app_colors.dart';
import 'package:todo/screens/tasks_screen.dart';
import 'package:todo/screens/setting_screen.dart';
import 'package:todo/widgets/app_name_widget.dart';
import 'package:todo/widgets/default_text.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static String routeName = "RootScreen";

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    TasksScreen(),
    SettingScreen(),
  ];

  DateTime initDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.primaryColor,
      // App Bar.
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: appNAmeWidget(context: context),
        ),
        backgroundColor: AppColors.customBlue,
      ),
      //Body.
      body: screens[currentIndex],
      // Bottom NavigationBar.
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        shape: const CircularNotchedRectangle(),
        height: 65,
        padding: EdgeInsets.zero,
        child: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: currentIndex,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.customBlue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesome5Icon.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Feather.settings), label: ""),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Colors.white, width: 3),
        ),
        backgroundColor: AppColors.customBlue,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              height: size.height * .75,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  defaultText(txt: "Add new Task"),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(hintText: "enter your task"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Select time",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: ()
                      {
                        setState(() {
                          _selectDate(context).then((value) {
                            Navigator.pop(context);
                          });
                        });},
                        // showDatePicker(
                        //   initialDate: DateTime.now(),
                        //   context: context,
                        //   firstDate: DateTime.now(),
                        //   lastDate: DateTime(
                        //     2030,
                        //     12,
                        //   ),
                        //);

                      child: Text(
                        initDate.toString().split(" ")[0],
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(3000));
    if (picked != null && picked != initDate) {
      setState(() {
        initDate = picked;
      });
    }
  }
}
