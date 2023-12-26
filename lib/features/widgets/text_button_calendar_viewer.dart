import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final Function setChangedDate;
  final String? initialText;

  const DatePickerButton(
      {Key? key,  required this.setChangedDate, this.initialText})
      : super(key: key);

  @override
  DatePickerButtonState createState() => DatePickerButtonState();
}

class DatePickerButtonState extends State<DatePickerButton> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
         selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );

        if (selectedDate != null) {
          setState(() {
            widget.setChangedDate(selectedDate);
          });
        }
      },
      child: Text(
        selectedDate == null
            ? widget.initialText ?? 'Select Date'
            : selectedDate.toString().substring(0, 10),
      ),
    );
  }
}
