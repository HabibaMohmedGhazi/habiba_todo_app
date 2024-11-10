import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/model/task_dm.dart';
import 'package:my_todo_app/ui/utilities/common/widgets/custom_elevated_button.dart';
import 'package:my_todo_app/ui/utilities/common/widgets/custom_text_field.dart';
import 'package:my_todo_app/ui/utilities/the_extensions/date_time_extension.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TheButtonSheet extends StatefulWidget {
  const TheButtonSheet({super.key});

  @override
  State<TheButtonSheet> createState() => _TheButtonSheetState();

  static void show(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const TheButtonSheet(),
      ),
    );
  }
}

class _TheButtonSheetState extends State<TheButtonSheet> {
  DateTime selectedDate = DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day);
  TextEditingController theTitleController = TextEditingController();
  TextEditingController theDescriptionController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context,
        listen:
            false); // we put 'listen: false' as we do not listen to any thing by this provider here
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Padding(
        /* to handel that the keyboard take a part of the button sheet
        add this line to the button padding ' MediaQuery.of(context).viewInsets.bottom '
        put I didn't make it as my emulator doesn't has a keyboard
        */
        padding: const EdgeInsets.only(top: 22, left: 44, right: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Add New Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            CustomTextField(
              hintText: 'Enter your task',
              controller: theTitleController,
            ),
            CustomTextField(
              hintText: 'Enter your task details',
              controller: theDescriptionController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 33),
              child: Text(
                'Select date',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            TextButton(onPressed: ()async {
              var date = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime.now(),
              lastDate: DateTime.now().add(
              const Duration(days: 365),),);
              if (date != null){
                selectedDate=DateTime(date.year,date.month,date.day);
                setState(() {

                });
                log('you selected a date');
              }



            }, child: Text(
              selectedDate.toFormatedDate,
              textAlign: TextAlign.center,
            ),),
            const Spacer(),
            CustomElevatedButton(

              data: isLoading
                  ? 'loading': 'Add',
              onPress: isLoading
                  ? null  // to make the button deactivated
                  : () async {
                      TaskDM newTask = TaskDM(
                          theId: '',
                          theTitle: theTitleController.text.trim(),
                          theDescription: theDescriptionController.text.trim(),
                          theDate: selectedDate);
                      setState(() {
                        isLoading = true;
                      });
                      await provider.addTask(newTask);
                      Navigator.of(context).pop();
                      setState(() {
                        isLoading = false;
                      });
                      log('you add a task');

              },
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> showTheDayPicker() async {
  //   selectedDate = (await showDatePicker(
  //         context: context,
  //         initialDate: selectedDate,
  //         firstDate: DateTime.now(),
  //         lastDate: DateTime.now().add(
  //           const Duration(days: 365),
  //         ),
  //
  //         builder: (context, child) {
  //           return Theme(
  //             data: Theme.of(context).copyWith(
  //               colorScheme: const ColorScheme.light(
  //                 primary: AppColors.thePrimary, // header background color
  //                 onPrimary: Colors.black, // header text color
  //                 onSurface: Colors.black, // body text color
  //               ),
  //             ),
  //             child: child!,
  //           );
  //         },
  //       )) ?? // if null
  //       selectedDate;
  //   setState(() {});
  // }

  // ****************************************************************
  // we removed this from here because we do not want to add any logic in this file
  // addTask() async {
  //   {
  //     // we will use try and catch as we use something that deals with the backend
  //     try {
  //       TaskDM newTask = TaskDM(
  //         theId: '',
  //         theTitle: theTitleController.text.trim(),
  //         // to get the text from the controller and trim is to remove any spaces
  //         theDescription: theDescriptionController.text.trim(),
  //         theDate: selectedDate,
  //         isDone: false,
  //       );
  //       await FirebaseServices.addTask(newTask);
  //       print('task add');
  //     } catch (e) {
  //       print(e);
  //       AnimatedSnackBar.rectangle(
  //         'Error',
  //         'An error happened to your adding task',
  //         type: AnimatedSnackBarType.success,
  //         brightness: Brightness.light,
  //       ).show(
  //         context,
  //       );
  //
  //     }
  //   }
  // }
}
