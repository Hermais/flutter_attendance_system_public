// create a stateful widget
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ClockViewerTextButton extends StatefulWidget {
  String? initialText;
  final Function setChangedTime;

  ClockViewerTextButton(
      {super.key, this.initialText, required this.setChangedTime});

  @override
  State<StatefulWidget> createState() => ClockViewerTextButtonState();
}

class ClockViewerTextButtonState extends State<ClockViewerTextButton> {
  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final timeOfDay = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );
        selectedTime = DateTime(0,0,0, timeOfDay!.hour, timeOfDay.minute);
        print(selectedTime);

        if (selectedTime != null) {
          setState(() {
            widget.initialText = selectedTime.toString();
            widget.setChangedTime(selectedTime);
          });
        }
      },
      child: Text(selectedTime == null
          ? widget.initialText ?? 'Select Time'
          : selectedTime!.toString().split(" ")[1].substring(0, 8)),
    );
  }
}
