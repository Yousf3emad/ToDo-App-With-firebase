import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/providers/theme_provider.dart';
import 'package:todo/root_screen.dart';
import 'package:todo/screens/edit_task_screen.dart';

import 'consts/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.customBlue,
                  titleTextStyle: TextStyle(
                    color: themeProvider.isDark ? Colors.black : Colors.white,
                  ),
                iconTheme: IconThemeData(
                  color:  themeProvider.isDark ? Colors.black : Colors.white,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(
                              color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.customBlue, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(12))),
            ),
            initialRoute: RootScreen.routeName,
            routes: {
              RootScreen.routeName: (context) => const RootScreen(),
              EditTaskScreen.routeName: (context) => const EditTaskScreen(),
            },
          );
        },
      ),
    );
  }
}
