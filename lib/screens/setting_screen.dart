import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widgets/default_text.dart';
import '../consts/app_colors.dart';
import '../providers/theme_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late String selectedLanguage;

  List<String> listOfLanguage = ["English", "Arabic"];

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    selectedLanguage = listOfLanguage[0].toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BottomAppBar(
          height: 6,
          color: AppColors.customBlue,
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(
                    bottom: 18.0,
                  ),
                  child: defaultText(
                      txt: "Language",
                      color: themeProvider.isDark ? Colors.white : null),
                ),
                subtitle: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    showMenu(
                      color: themeProvider.isDark
                          ? AppColors.secondaryDarkColor
                          : AppColors.primaryColor,
                      context: context,
                      position: RelativeRect.fromLTRB(
                          size.width * .30, size.height * .30, 50, 20),
                      items: [
                        PopupMenuItem(
                          value: 1,
                          child: Text('English',
                              style: TextStyle(
                                  color: themeProvider.isDark
                                      ? Colors.white
                                      : null)),
                          onTap: () {
                            setState(() {
                              selectedLanguage = listOfLanguage[0];
                            });
                          },
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('Arabic',
                              style: TextStyle(
                                  color: themeProvider.isDark
                                      ? Colors.white
                                      : null)),
                          onTap: () {
                            setState(() {
                              selectedLanguage = listOfLanguage[1];
                            });
                          },
                        ),
                      ],
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 18.0,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: themeProvider.isDark
                          ? AppColors.secondaryDarkColor
                          : Colors.white,
                      border: Border.all(color: AppColors.customBlue),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultText(
                            txt: selectedLanguage,
                            color: themeProvider.isDark ? Colors.white : null),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.customBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(
                    bottom: 18.0,
                  ),
                  child: defaultText(
                      txt: "Mode",
                      color: themeProvider.isDark ? Colors.white : null),
                ),
                subtitle: InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    showMenu(
                      color: themeProvider.isDark
                          ? AppColors.secondaryDarkColor
                          : AppColors.primaryColor,
                      context: context,
                      position: RelativeRect.fromLTRB(
                          size.width * .30, size.height * .48, 50, 20),
                      items: [
                        PopupMenuItem(
                          value: 1,
                          onTap: () {
                            setState(() {
                              if (themeProvider.isDark != false) {
                                themeProvider.setIsDark(false);
                              }
                            });
                          },
                          child: Text(
                            'Light',
                            style: TextStyle(
                                color:
                                    themeProvider.isDark ? Colors.white : null),
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          onTap: () {
                            setState(() {
                              if (themeProvider.isDark != true) {
                                themeProvider.setIsDark(true);
                              }
                            });
                          },
                          child: Text(
                            'Dark',
                            style: TextStyle(
                                color:
                                    themeProvider.isDark ? Colors.white : null),
                          ),
                        ),
                      ],
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 18.0,
                    ),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: themeProvider.isDark
                          ? AppColors.secondaryDarkColor
                          : Colors.white,
                      border: Border.all(color: AppColors.customBlue),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultText(
                            txt: themeProvider.isDark ? "Dark" : "Light",
                            color: themeProvider.isDark ? Colors.white : null),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: AppColors.customBlue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
