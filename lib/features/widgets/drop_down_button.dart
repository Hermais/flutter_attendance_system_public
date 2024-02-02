// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DropdownButtonWidget<T> extends StatefulWidget {
  T? value;
  final List<T> items;
  final String? selectionDescription;
  final Function setValue;
  final bool? enabled ;


  DropdownButtonWidget({Key? key,  this.value, required this.items, this.selectionDescription, required this.setValue, this.enabled})
      : super(key: key);

  @override
  DropdownButtonWidgetState<T> createState() => DropdownButtonWidgetState<T>();
}

class DropdownButtonWidgetState<T> extends State<DropdownButtonWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: DropdownButtonFormField<T>(
          icon: const Icon(Icons.arrow_drop_down_outlined),
          value: widget.value,
          onChanged: widget.enabled ?? true ? (T? value) {
            setState(() {
              widget.value =  value;
              widget.setValue(value);

            });
          } : null,
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
        ),
      ),
    );
  }
}
