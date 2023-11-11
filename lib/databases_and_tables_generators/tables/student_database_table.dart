import 'package:flutter/material.dart';

import '../data_row_generators/universal_data_row_list_generator.dart';
import '../users_model_classes/student.dart';
class StudentDataBaseTable extends StatelessWidget{
  List<Student> students;


  StudentDataBaseTable(this.students, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      DataTable(
          columns: const <DataColumn>[
            /// These fields can and will be modified.
            DataColumn(label: Text("Id")),
            DataColumn(label: Text("Student Name")),
            DataColumn(label: Text("Identifier")),
            DataColumn(label: Text("Date of birth")),
            DataColumn(label: Text("University ID")),
          ],
          rows:
          DataRowListGenerator(students).generateRow()

      ),
    ]);
  }
}