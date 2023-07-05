import 'package:flutter/material.dart';

Future<DateTime?> pickDateTime(context) async {
  return showDatePicker(
      builder: (context, child) {
        return Theme(data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: const Color.fromARGB(65, 3, 168, 244), // header background color
            onPrimary: Colors.blue, // header text color
            onSurface: Colors.black, // body text color
            surfaceTint: Colors.white
          ),
          useMaterial3: true,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.blue, // button text color
            ),
          ),
        ),
        child: child!
        );},
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(days: 7)),
    lastDate: DateTime.now().add(const Duration(days: 2))
    ).then((date) {
        if (date != null) {
          return showTimePicker(
        builder: (context, child) {
          return Theme(data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: const Color.fromARGB(65, 3, 168, 244), // header background color
              onPrimary: Colors.blue, // header text color
              onSurface: Colors.black, // body text color
              surfaceTint: Colors.white
            ),
              useMaterial3: true,
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue, // button text color
                ),
              ),
            ),
            child: child!
            );},
        context: context,
        initialTime: TimeOfDay.now(),
            ).then((time) {
              if (time != null) {
                final combined = DateTime(date.year,date.month,date.day,time.hour,time.minute);
                return combined;
              }
            });

          }
        });
}