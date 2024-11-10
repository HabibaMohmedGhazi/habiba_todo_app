import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/providers/task_provider.dart';
import 'package:my_todo_app/ui/screens/the_button_sheet.dart';
import 'package:my_todo_app/ui/utilities/common/app_colors.dart';
import 'package:my_todo_app/ui/utilities/common/custom_scaffold_background.dart';
import 'package:provider/provider.dart';
import '../tabs/tasks/task_tab.dart';
import '../tabs/setting_tab.dart';
import '../utilities/widgets_and_functions.dart';

class TheMainScreen extends StatefulWidget {
  static String theRouteName = 'the main screen';
  const TheMainScreen({super.key});

  @override
  State<TheMainScreen> createState() => _TheMainScreenState();
}

class _TheMainScreenState extends State<TheMainScreen> {
  int currentIndex = 0; // to initialize the tab that you open it
  List<Widget> tabList = [const TaskTab(), SettingTab()];
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldBackground(
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // to make it like the design in the center
      // backgroundColor: AppColors.theBackgroundLight,
      appBar: theMainAppBarWidget,
      body: tabList[currentIndex], // to move between tabs
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget? buildBottomNavigation() => BottomAppBar(
        height: 70,
        padding: EdgeInsets.zero,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.hardEdge,
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex:
              currentIndex, // to make the app know which index is selected now
          // change the current index on tap
          onTap: (tappedIndex) {
            currentIndex = tappedIndex;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.list_bullet,
              ),
              label: 'menu',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined), label: 'settings')
          ],
        ),
      );
  Widget? buildFloatingActionButton() => FloatingActionButton(
        backgroundColor:
            Provider.of<TaskProvider>(context).selectedDate.isBefore(
                      DateTime.now().subtract(
                        const Duration(days: 1),
                      ),
                    )
                ? Colors.grey
                : AppColors.thePrimary,
        onPressed: Provider.of<TaskProvider>(context).selectedDate.isBefore(
                  DateTime.now().subtract(
                    const Duration(days: 1),
                  ),
                )
            ? null
            : () {
                TheButtonSheet.show(context);
              },
        child: const Icon(
          CupertinoIcons.add,
          size: 30,
        ),
      );
}
