import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final DateTime? selectedDate;
  final Function setChangedDate;
  final String? initialText;

  const DatePickerButton(
      {Key? key, this.selectedDate, required this.setChangedDate, this.initialText})
      : super(key: key);

  @override
  DatePickerButtonState createState() => DatePickerButtonState();
}

class DatePickerButtonState extends State<DatePickerButton> {

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
            widget.setChangedDate(widget.selectedDate);
          });
        }
      },
      child: Text(
        widget.selectedDate == null
            ? widget.initialText ?? 'Select Date'
            : widget.selectedDate.toString(),
      ),
    );
  }
}
