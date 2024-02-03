// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectDropdownWidget<T> extends StatefulWidget {
  final List<T> items;
  final String? selectionDescription;
  final Function(List<T>?) setValues;

  MultiSelectDropdownWidget({
    Key? key,
    required this.items,
    this.selectionDescription,
    required this.setValues,
  }) : super(key: key);

  @override
  _MultiSelectDropdownWidgetState<T> createState() =>
      _MultiSelectDropdownWidgetState<T>();
}

class _MultiSelectDropdownWidgetState<T>
    extends State<MultiSelectDropdownWidget<T>> {
  List<T> _selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField<T>(

      items: widget.items
          .map((value) => MultiSelectItem<T>(value, value.toString()))
          .toList(),
      listType: MultiSelectListType.CHIP,
      onConfirm: (values) {
        setState(() {
          _selectedValues = values;
          widget.setValues(_selectedValues);
        });
      },

      chipDisplay: MultiSelectChipDisplay<T>(
        onTap: (item) {
          setState(() {
            _selectedValues.remove(item);
            widget.setValues(_selectedValues);
          });
        },
      ),
      buttonText: Text(widget.selectionDescription ?? 'Select items'),
    );
  }
}


