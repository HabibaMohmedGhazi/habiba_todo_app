import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/utilities/common/app_colors.dart';

class SettingTab extends StatefulWidget {
  SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  String selectedLanguage = 'en';

  bool isDarkThemeOn = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.thePrimary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 7)),
          child: const Text(
            'Choose the language',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
        buildLanguageMenu(),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: AppColors.thePrimary,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 7)),
          child: const Text(
            'Choose the Theme',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        buildThemeSwitch(),
      ],
    );
  }

  Widget buildThemeSwitch() => Switch(
        inactiveTrackColor: Colors.white,
        value: isDarkThemeOn,
        activeColor: AppColors.thePrimary,
        onChanged: (newValue) {
          isDarkThemeOn = newValue;
          setState(() {});
        },
      );

  Widget buildLanguageMenu() => DropdownButton(
        value: selectedLanguage,
        isExpanded: true,
        hint: const Text(
          'languages',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        items: const [
          DropdownMenuItem<String>(
            value: 'en',
            child: Text('English'),
          ),
          DropdownMenuItem<String>(
            value: 'ar',
            child: Text('عربي'),
          ),
        ],
        onChanged: (newValue) {
          selectedLanguage = newValue ?? selectedLanguage;
          setState(() {});
        },
      );
}
