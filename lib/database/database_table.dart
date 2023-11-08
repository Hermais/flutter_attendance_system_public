import 'package:flutter/material.dart';

import 'data_row_list_generator.dart';
import 'ORMs/medicine.dart';
class DataBaseTable extends StatelessWidget{
  List<Medicine> medicines;


  DataBaseTable(this.medicines, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      DataTable(
          columns: const <DataColumn>[
            DataColumn(label: Text("Id")),
            DataColumn(label: Text("Commercial Name")),
            DataColumn(label: Text("Price")),
            DataColumn(label: Text("Quantity")),
            DataColumn(label: Text("Drug Name")),
            DataColumn(label: Text("Manufacturing Date")),
            DataColumn(label: Text("Manufacturer")),
          ],
          rows: //<DataRow>[
          // This should be replaced by a list iterator.
          DataRowListGenerator(medicines).generateRow()

        //],
      ),
    ]);
  }
}