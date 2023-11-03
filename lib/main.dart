// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:flutter_attendance_system/database/data_row_list_generator.dart';

import 'database/ORMs/medicine.dart';
import 'package:flutter_attendance_system/login/login_page.dart';

void main() {
  runApp(MaterialApp(home:LoginPage()));
}

class StudentDataBaseUI extends StatefulWidget {
  const StudentDataBaseUI({super.key});

  @override
  State<StudentDataBaseUI> createState() => _StudentDataBaseUIState();
}

class _StudentDataBaseUIState extends State<StudentDataBaseUI> {
  List<Medicine> medicines = [];

  @override
  void initState() {
    super.initState();
    fetchMedicinesFromBackEnd();
  }

  /// This loads the local json file, as a test of course.
  // Future<void> loadMedicineDataLocal() async {
  //   final jsonString = await rootBundle.loadString('assets/localDB.json');
  //   final jsonData = json.decode(jsonString);
  //
  //   // Parse the JSON data and create Medicine instances.
  //   for (var item in jsonData) {
  //     final medicine = Medicine(
  //       item['id'],
  //       item['commercialName'],
  //       item['price'].toDouble(),
  //       item['stockQty'],
  //       item['drugName'],
  //       item['manufacturingDate'],
  //       item['manufacturerName'],
  //     );
  //     medicines.add(medicine);
  //   }
  //
  //   setState(() {
  //     // Call setState to rebuild the UI with the loaded data.
  //   });
  // }

  Future<void> fetchMedicinesFromBackEnd() async {
    medicines = [];
    final response = await http.get(
      Uri.parse('http://192.168.1.10:8080/api/medicine'),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      // Parse the JSON data and create Medicine instances.
      for (var item in jsonData) {
        final medicine = Medicine.withId(
          item['id'],
          item['commercialName'],
          item['price'].toDouble(),
          item['stockQty'],
          item['drugName'],
          item['manufacturingDate'],
          item['manufacturerName'],
        );
        medicines.add(medicine);
      }

      setState(() {
        // Call setState to rebuild the UI with the loaded data.
      });
    } else {
      throw Exception('Failed to load medicines');
    }
  }

  Future<void> addMedicine(Medicine newMedicine) async {
    const String apiUrl = 'http://192.168.1.10:8080/api/medicine';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newMedicine.toJson()),
    );

    if (response.statusCode == 200) {
      fetchMedicinesFromBackEnd();
      // Medicine added successfully. You can handle the response as needed.
    } else {
      throw Exception('Failed to add medicine');
    }
  }

  Future<void> deleteMedicine(int id) async {
    final response = await http
        .delete(Uri.parse('http://192.168.1.10:8080/api/medicine/$id'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      fetchMedicinesFromBackEnd();
      print('Medicine with ID $id deleted successfully.');
    } else {
      print('Failed to delete medicine with ID $id');
    }
  }

  /// Unused method that allows us to add an entry and append it to the json file.
  // Future<void> addMedicineEntryLocal(Medicine newMedicine) async {
  //   // Read the existing JSON data from the file.
  //   final jsonString = await rootBundle.loadString('assets/localDB.json');
  //   final List<dynamic> jsonData = json.decode(jsonString);
  //
  //   // Create a new entry based on the Medicine object and add it to the List.
  //   jsonData.add({
  //     "id": newMedicine.id,
  //     "commercialName": newMedicine.commercialName,
  //     "drugName": newMedicine.drugName,
  //     "price": newMedicine.price,
  //     "manufacturingDate": newMedicine.manufacturingDate,
  //     "manufacturerName": newMedicine.manufacturerName,
  //     "stockQty": newMedicine.stockQty,
  //   });
  //
  //   // Convert the updated List back to JSON.
  //   final updatedJsonString = json.encode(jsonData);
  //
  //   // Write the updated JSON data back to the file.
  //   final file = File(
  //       'assets'); // You may need to use the correct file path.
  //   await file.writeAsString(updatedJsonString);
  //   await loadMedicineDataLocal();
  // }


  Future<void> _showAddMedicineDialog(BuildContext context) async {

    Medicine newMedicine;

    var commercialName;
    var price;
    var stockQty;
    var drugName;
    var manufacturingDate;
    var manufacturerName;

    Future<void> _selectDate(BuildContext context) async {
      DateTime selectedDate = DateTime.now(); // Initialize with the current date

      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != selectedDate) {
        // Format the selected date as a string
        String formattedDate = DateFormat('yyyy-MM-dd').format(picked);

        // Update your date variable with the formatted date string
        setState(() {
          selectedDate = picked;
          manufacturingDate = formattedDate; // Assign the formatted date to your variable
        });
      }
    }


    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a New Medicine'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Commercial Name'),
                  onChanged: (value) {
                    commercialName = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Price'),
                  onChanged: (value) {
                    price = double.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Stock Quantity'),
                  onChanged: (value) {
                    stockQty = int.parse(value);
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Drug Name'),
                  onChanged: (value) {
                    drugName = value;
                  },
                ),
                TextButton(
                  onPressed: () {
                    _selectDate(context); // Call the date picker function
                  },
                  child: Text('Select Manufacturing Date'),
                ),

                TextField(
                  decoration: InputDecoration(labelText: 'Manufacturer'),
                  onChanged: (value) {
                    manufacturerName = value;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                newMedicine = Medicine.withoutId(
                    commercialName, price, stockQty, drugName,
                    manufacturingDate, manufacturerName);
                addMedicine(newMedicine);
                // Validate and add the new medicine to the database or perform the API call here
                // You can also handle validation here before adding the medicine
                // Call a function to add the medicine to your backend here
                // For example: _addMedicine(newMedicine);

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            // addMedicine(Medicine.withoutId("lo0alfmkada",950,1000,"laughOutLoud",
            //     "2022-04-06", "LaughFactory"));

            //deleteMedicine(7);
            _showAddMedicineDialog(context);
          }),
      appBar: AppBar(
        title: const Text("My Data Base"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              fetchMedicinesFromBackEnd();
            },
          ),
        ],

      ),
      body: ListView(scrollDirection: Axis.horizontal, children: [
        Container(
          child: DataTable(
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
            /**
                DataRow(cells: <DataCell>[
                DataCell(Text(medicines[0].id.toString())),
                DataCell(Text(medicines[0].commercialName)),
                DataCell(Text(medicines[0].price.toString())),
                DataCell(Text(medicines[0].stockQty.toString())),
                DataCell(Text(medicines[0].drugName)),
                DataCell(Text(medicines[0].manufacturingDate)),
                DataCell(Text(medicines[0].manufacturerName)),

                ]),
                DataRow(cells: <DataCell>[
                DataCell(Text(medicines[1].id.toString())),
                DataCell(Text(medicines[1].commercialName)),
                DataCell(Text(medicines[1].price.toString())),
                DataCell(Text(medicines[1].stockQty.toString())),
                DataCell(Text(medicines[1].drugName)),
                DataCell(Text(medicines[1].manufacturingDate)),
                DataCell(Text(medicines[1].manufacturerName)),

                ])
             **/
            //],
          ),
        ),
      ]),
    );
  }
}
