import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/consts/app_colors.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/screens/tasks_screen.dart';
import 'package:todo/screens/setting_screen.dart';
import 'package:todo/widgets/app_name_widget.dart';
import 'package:todo/widgets/floating_action_button/floating_action_btn.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  static String routeName = "RootScreen";

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    const TasksScreen(),
    const SettingScreen(),
  ];
  List<String> titles = ["To Do List", "Settings"];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: themeProvider.isDark
          ? AppColors.primaryDarkColor
          : AppColors.primaryColor,
      // App Bar.
      appBar: AppBar(
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: appNameWidget(context: context, txt: titles[currentIndex]),
        ),
        backgroundColor: AppColors.customBlue,
      ),
      //Body.
      body: screens[currentIndex],
      // Bottom NavigationBar.
      bottomNavigationBar: BottomAppBar(
        color: themeProvider.isDark? AppColors.secondaryDarkColor : Colors.white,
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
      floatingActionButton: const FloatingActionBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
