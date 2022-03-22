/// ***
/// This class consists of the DateWidget that is used in the ListView.builder
///
/// Author: Vivek Kaushik <me@vivekkasuhik.com>
/// github: https://github.com/iamvivekkaushik/
/// ***

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final Color selectionColorBorder;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  DateWidget({
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    required this.selectionColorBorder,
    this.width,
    this.onDateSelected,
    this.locale,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: width,
        margin: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          border: Border.all(color: selectionColorBorder),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: selectionColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(new DateFormat("E", locale).format(date).toUpperCase(), // WeekDay
                  style: dayTextStyle),
              Text(new DateFormat("MMM", locale).format(date).toUpperCase(), // Month
                  style: monthTextStyle),
              Text(date.day.toString(), // Date
                  style: dateTextStyle),

            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(this.date);
        }
      },
    );
  }
}
