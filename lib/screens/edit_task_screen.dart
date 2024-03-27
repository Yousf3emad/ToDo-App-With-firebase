import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../consts/app_colors.dart';
import '../providers/theme_provider.dart';
import '../widgets/app_name_widget.dart';
import '../widgets/default_text.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});

  static String routeName = "EditTask";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  DateTime initialDate = DateTime.now();

  late final GlobalKey<FormState> _formKey;

  //Controllers
  late final TextEditingController _titleController;

  late final TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDark
          ? AppColors.primaryDarkColor
          : AppColors.primaryColor,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: appNameWidget(context: context, txt: "To Do List"),
        ),
        backgroundColor: AppColors.customBlue,
      ),
      body: Stack(
        //alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 80,
            color: AppColors.customBlue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Container(
              height: size.height * .75,
              decoration: BoxDecoration(
                color: themeProvider.isDark
                    ? AppColors.secondaryDarkColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      defaultText(
                          color: themeProvider.isDark ? Colors.white : null,
                          txt: "Edit Task"),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: themeProvider.isDark ? Colors.white : null),
                        keyboardType: TextInputType.text,
                        controller: _titleController,
                        validator: (value) {
                          if (value == null || _titleController.text.isEmpty) {
                            return "Please enter task title";
                          }
                          return null;
                        },
                        cursorColor: AppColors.customBlue,
                        decoration: const InputDecoration(
                          label: Text(
                            "this is title",
                            style: TextStyle(
                                //color: Colors.grey,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        style: TextStyle(
                            color: themeProvider.isDark ? Colors.white : null),
                        keyboardType: TextInputType.text,
                        controller: _descriptionController,
                        validator: (value) {
                          if (value == null || _titleController.text.isEmpty) {
                            return "Please enter task description";
                          }
                          return null;
                        },
                        cursorColor: AppColors.customBlue,
                        decoration: const InputDecoration(
                          label: Text(
                            "task details",
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: Text(
                          "Select time",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: themeProvider.isDark ? Colors.white : null,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        child: Text(
                          initialDate.toString().substring(0, 10),
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.0,
                              color: AppColors.customBlue),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              debugPrint("Validate");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.customBlue,
                            padding: const EdgeInsets.all(20.0),
                          ),
                          child: defaultText(
                              txt: "Save changes", color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (selectedDate != null) {
      setState(() {
        initialDate = selectedDate;
      });
    }
  }
}
