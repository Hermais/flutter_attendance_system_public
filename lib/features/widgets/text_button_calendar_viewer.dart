import 'package:flutter/material.dart';

class DatePickerButton extends StatefulWidget {
  final String? selectedDate;
  final Function setChangedDate;

  const DatePickerButton({Key? key, this.selectedDate, required this.setChangedDate})
      : super(key: key);

  @override
  DatePickerButtonState createState() => DatePickerButtonState();
}

class DatePickerButtonState extends State<DatePickerButton> {
  String? localSelectedDate;
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
            localSelectedDate = "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
            widget.setChangedDate(widget.selectedDate);
          });
        }
      },
      child: Text(localSelectedDate ?? 'Select Date of Birth'),
    );
  }
}