import 'package:flutter/material.dart';

import '../users_model_classes/student.dart';

class DataRowListGenerator<T> {
  final List<T> jsonRowList;

  DataRowListGenerator(this.jsonRowList);

  List<DataRow> generateRow() {
    if (jsonRowList.isEmpty) {
      return <DataRow>[]; // Return an empty list when jsonRowList is empty.
    }
    else if (T == Student) {
      return jsonRowList.map((item) {
        return DataRow(cells: <DataCell>[
          DataCell(Text((item as Student).id.toString())),
          DataCell(Text(item.studentName)),
          DataCell(Text(item.identifier)),
          DataCell(Text(item.dob)),
          DataCell(Text(item.universityID.toString())),

        ]);
      }).toList();
    }
    return const [DataRow(cells: [DataCell(Text("Error!!!!!!!!"))])];
  }
}
