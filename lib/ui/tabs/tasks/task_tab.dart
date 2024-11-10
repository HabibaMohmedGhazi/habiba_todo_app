import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/ui/providers/task_provider.dart';
import 'package:my_todo_app/widgets/task_card.dart';
import 'package:provider/provider.dart';

import '../../utilities/common/app_colors.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  EasyInfiniteDateTimelineController? controller =
      EasyInfiniteDateTimelineController();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TaskProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: EasyInfiniteDateTimeLine(
            selectionMode: const SelectionMode.autoCenter(),
            controller: controller,
            firstDate: DateTime(2023),
            focusDate: provider.selectedDate,
            lastDate: provider.selectedDate.add(
              const Duration(days: 365),
            ),
            showTimelineHeader: false,
            onDateChange: (newDate) {
              provider.changeSelectedDate(newDate);
            },
            dayProps: EasyDayProps(
              height: 100,
              todayStyle: DayStyle(
                  decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(12),
              )),
              inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(
                color: AppColors.theWhite,
                borderRadius: BorderRadius.circular(12),
              )),
              activeDayStyle: DayStyle(
                  monthStrStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  dayStrStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  dayNumStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.theWhite,
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: provider.tasks.length,
            padding: const EdgeInsets.only(top: 5),
            itemBuilder: (context, index) => TaskCard(
              taskModel: provider.tasks[index],
            ),
          ),
        ),
      ],
    );
  }
  // Widget buildTheCalendarTimeLine() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: EasyInfiniteDateTimeLine(
  //       selectionMode: const SelectionMode.autoCenter(),
  //       controller: controller,
  //       firstDate: DateTime(2023),
  //       focusDate: provider.selectedDate,
  //       lastDate: provider.selectedDate.add(
  //         const Duration(days: 365),
  //       ),
  //       showTimelineHeader: false,
  //       onDateChange: (newDate) {
  //         provider.changeSelectedDate(newDate);
  //         setState(() {});
  //       },
  //       dayProps: EasyDayProps(
  //         height: 100,
  //         todayStyle: DayStyle(
  //             decoration: BoxDecoration(
  //               color: Colors.blue[100],
  //               borderRadius: BorderRadius.circular(12),
  //             )),
  //         inactiveDayStyle: DayStyle(
  //             decoration: BoxDecoration(
  //               color: AppColors.theWhite,
  //               borderRadius: BorderRadius.circular(12),
  //             )),
  //         activeDayStyle: DayStyle(
  //             monthStrStyle: TextStyle(
  //               color: Theme.of(context).primaryColor,
  //               fontSize: 15,
  //               fontWeight: FontWeight.w700,
  //             ),
  //             dayStrStyle: TextStyle(
  //               color: Theme.of(context).primaryColor,
  //               fontSize: 15,
  //               fontWeight: FontWeight.w700,
  //             ),
  //             dayNumStyle: TextStyle(
  //               color: Theme.of(context).primaryColor,
  //               fontSize: 20,
  //               fontWeight: FontWeight.w700,
  //             ),
  //             decoration: BoxDecoration(
  //               color: AppColors.theWhite,
  //               borderRadius: BorderRadius.circular(12),
  //             )),
  //       ),
  //     ),
  //   );
  // }
}
