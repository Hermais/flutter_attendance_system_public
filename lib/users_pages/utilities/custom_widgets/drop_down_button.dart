// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DropdownButtonWidget<T> extends StatefulWidget {
  T? value;
  final List<T> items;
  final String? selectionDescription;
  final Function setValue;


  DropdownButtonWidget({Key? key,  this.value, required this.items, this.selectionDescription, required this.setValue})
      : super(key: key);

  @override
  DropdownButtonWidgetState<T> createState() => DropdownButtonWidgetState<T>();
}

class DropdownButtonWidgetState<T> extends State<DropdownButtonWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      icon: const Icon(Icons.arrow_drop_down_outlined),
      value: widget.value,
      onChanged: (T? value) {
        setState(() {
          widget.value =  value;
          widget.setValue(value);

        });
      },
      items: widget.items
          .map<DropdownMenuItem<T>>(
            (T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(value.toString()),
          );
        },
      ).toList(),
      hint: Text(widget.selectionDescription ?? 'Select an item'),
    );
  }
}
