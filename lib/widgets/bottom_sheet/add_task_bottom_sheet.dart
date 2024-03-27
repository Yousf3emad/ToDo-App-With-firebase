import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/providers/theme_provider.dart';

import '../../consts/app_colors.dart';
import '../default_text.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
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
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9, top: 2.0),
            width: 140,
            height: 9,
            decoration: BoxDecoration(
              color: themeProvider.isDark? AppColors.customBlue : Colors.grey.shade400,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          defaultText(txt: "Add new Task",color: themeProvider.isDark? Colors.white : null),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            style: TextStyle(color: themeProvider.isDark? Colors.white : null),
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
                "Title",
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
            style: TextStyle(color: themeProvider.isDark? Colors.white : null),
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
                "Description",
                style:
                    TextStyle(fontWeight: FontWeight.w300, letterSpacing: 1.5),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
           SizedBox(
            width: double.infinity,
            child: Text(
              "Select time",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: themeProvider.isDark? Colors.white : null,
                fontSize: 20,
                fontWeight: FontWeight.w400,
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
                color: AppColors.customBlue
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  debugPrint("validate");
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.customBlue,
                padding: const EdgeInsets.all(20.0),
              ),
              child: defaultText(txt: "Add Task", color: Colors.white),
            ),
          )
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
