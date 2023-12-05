// create a stateful widget
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ClockViewerTextButton extends StatefulWidget{
   String? selectedTime;
  final Function setChangedTime;
  ClockViewerTextButton({super.key, this.selectedTime, required this.setChangedTime});

  @override
  State<StatefulWidget> createState() => ClockViewerTextButtonState();



}

class ClockViewerTextButtonState extends State<ClockViewerTextButton>{


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        TimeOfDay? selectedTime = await showTimePicker(
          initialTime: TimeOfDay.now(),
          context: context,
        );

        if (selectedTime != null) {
          setState(() {
            widget.selectedTime = selectedTime.format(context);
            widget.setChangedTime(widget.selectedTime);
          });
        }
      },
      child: Text(widget.selectedTime ?? 'Select Time'),
    );
  }
}