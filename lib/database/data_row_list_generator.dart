import 'package:flutter/material.dart';

import 'ORMs/medicine.dart';

class DataRowListGenerator {
  final List<Medicine> jsonRowList;

  DataRowListGenerator(this.jsonRowList);

  List<DataRow> generateRow() {
    if (jsonRowList.isEmpty) {
      return <DataRow>[]; // Return an empty list when jsonRowList is empty.
    } else {
      //Medicine.lastID = jsonRowList[jsonRowList.length-1].id;
      return jsonRowList.map((item) {
        return DataRow(cells: <DataCell>[
          DataCell(Text(item.id.toString())),
          DataCell(Text(item.commercialName)),
          DataCell(Text(item.price.toString())),
          DataCell(Text(item.stockQty.toString())),
          DataCell(Text(item.drugName)),
          DataCell(Text(item.manufacturingDate)),
          DataCell(Text(item.manufacturerName)),
        ]);
      }).toList();
    }
  }
}
