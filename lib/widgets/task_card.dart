import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_todo_app/ui/providers/task_provider.dart';
import 'package:provider/provider.dart';

import '../ui/model/task_dm.dart';
import '../ui/utilities/common/app_colors.dart';

class TaskCard extends StatelessWidget {
  final TaskDM taskModel;
  const TaskCard({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        key: UniqueKey(),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          dismissible: DismissiblePane(onDismissed: () {
            Provider.of<TaskProvider>(context, listen: false)
                .deleteTask(taskModel.theId);
          }),
          children: [
            SlidableAction(
              onPressed: (context) async {},
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(20),
            ),
          ],
        ),
        child: Card(
          elevation: 6,
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          // we used here listTile as it make it a lot easier than making a row and column inside it
          child: SizedBox(
            height: 95,
            child: Center(
              child: ListTile(
                title: Text(taskModel.theTitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium // take the style from the theme
                    ),
                subtitle: Text(
                  taskModel.theDescription,
                ),
                subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
                leading: Container(
                  height: 50,
                  width: 4,
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                trailing: Container(
                  width: 50,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .primaryColor, // to make it change by changing the theme
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.done,
                    color: AppColors.theWhite,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
