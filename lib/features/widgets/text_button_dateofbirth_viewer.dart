import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  String? selectedDate;
  final Function setChangedDate;

  DatePickerButton({Key? key, this.selectedDate, required this.setChangedDate})
      : super(key: key);

  @override
  _DatePickerButtonState createState() => _DatePickerButtonState();
}

class _DatePickerButtonState extends State<DatePickerButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (selectedDate != null) {
          setState(() {
            widget.selectedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
            widget.setChangedDate(widget.selectedDate);
          });
        }
      },
      child: Text(widget.selectedDate ?? 'Select Date of Birth'),
    );
  }
}