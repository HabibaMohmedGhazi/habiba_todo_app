import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/app_colors.dart';

// there is a website called flutter gems has a lot of packages " highly recommended "

Widget theEasyDateTimeWidget = EasyDateTimeLine(
  initialDate: DateTime.now(),
  onDateChange: (selectedDate) {
    //`selectedDate` the new date selected.
  },
  activeColor: Colors.white,
  headerProps: const EasyHeaderProps(showHeader: false),
  dayProps: const EasyDayProps(
    dayStructure: DayStructure.dayStrDayNum,
    height: 79,
    width: 58,
  ),
);

AppBar theMainAppBarWidget = AppBar(
  title: const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'To Do app',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
);

AppBar theSettingAppBarWidget = AppBar(
  title: const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'Setting',
      style: TextStyle(
        fontSize: 22,
        color: AppColors.theWhite,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  // backgroundColor: AppColors.thePrimary,
);
AppBar theListAppBarWidget = AppBar(
  title: const Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      'List',
      style: TextStyle(
        fontSize: 22,
        color: AppColors.theWhite,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  backgroundColor: AppColors.thePrimary,
);
