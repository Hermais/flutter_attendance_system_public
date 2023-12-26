import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/core/data/models/parent_model.dart';
import 'package:flutter_attendance_system/core/data/models/student_model.dart';
import 'package:flutter_attendance_system/core/data/repositories/student_repository.dart';
import 'package:flutter_attendance_system/core/data/services/student_web_services.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/drop_down_button.dart';
import '../../../widgets/multi_drop_down_button.dart';
import '../../../widgets/text_button_calendar_viewer.dart';
import '../../../widgets/text_button_clock_viewer.dart';

class FacultyAdminPopups {
  final BuildContext context;
  String? _courseCode;
  String? _startTime;
  String? _endTime;
  String? _hallLocation;
  String? _courseName;
  String? _term;
  String? _groupName;
  String? _instructorName;
  String? _courseDescription;
  DateTime? _studentDateOfBirth;
  String? _studentFirstName;
  String? _studentLastName;
  String? _studentEmailID;
  String? _studentNationalID;
  int? _studentAcademicYear;
  String? _studentDepartment;
  String? _parentEmailID;
  String? _parentFirstName;
  String? _parentLastName;
  String? _parentNationalID;
  DateTime? _parentDateOfBirth;
  int? _adminID;
  String? _instructorDateOfBirth;
  String? _instructorFirstName;
  String? _instructorLastName;
  String? _instructorEmailID;
  String? _instructorNationalID;
  String? _instructorDepartment;
  List<String>? _instructorCourses;
  bool? _isFloatingActionButtonVisible;
  bool? _typeMessage;
  DateTime? _lectureStartDate;
  Function setState;

  FacultyAdminPopups({required this.context, required this.setState});

  Future<void> showTimetablesDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Lecture'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Specify Main Properties:'),
                DropdownButtonWidget<String>(
                  items: const [
                    'Preparatory',
                    'First Year',
                    'Second Year',
                    'Third Year',
                    'Fourth Year'
                  ],
                  selectionDescription: 'Academic Year',
                  setValue: (String? value) {
                    _groupName = value!;
                  },
                ),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const Text('Select Lecture Details:'),
                DatePickerButton(
                  initialText: 'Select Start Date',
                  setChangedDate: (value) {
                    _lectureStartDate = value!;
                  },
                ),
                ClockViewerTextButton(
                  setChangedTime: (String? value) {
                    _startTime = value!;
                  },
                  selectedTime: 'Select Start Time',
                ),
                ClockViewerTextButton(
                  setChangedTime: (String? value) {
                    _endTime = value!;
                  },
                  selectedTime: 'Select End Time',
                ),
                DropdownButtonWidget<String>(
                  items: const [
                    'Instructor 1',
                    'Instructor 2',
                    'Instructor 3',
                    'Instructor 4'
                  ],
                  selectionDescription: 'Select Instructor',
                  setValue: (String? value) {
                    _instructorName = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: const ['Code 1', 'Code 2', 'Code 3', 'Code 4'],
                  selectionDescription: 'Select Course Code',
                  setValue: (String? value) {
                    _courseCode = value!;
                  },
                ),
                DropdownButtonWidget<String>(
                  items: const [
                    'Location 1',
                    'Location 2',
                    'Location 3',
                    'Location 4'
                  ],
                  selectionDescription: 'Select Hall Location',
                  setValue: (String? value) {
                    _hallLocation = value!;
                  },
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Do something with the entered data
                //Navigator.pop(context); // Close the dialog
              },
              child: const Text('Add  lecture'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showAddEntitiesDialog() async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      showAddInstructorDialog();
                    },
                    child: const Text(
                      'Add Instructor',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      showAddStudentDialog();
                    },
                    child: const Text(
                      'Add Student',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> showAddInstructorDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add Instructor',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _instructorNationalID = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Admin ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _instructorFirstName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _instructorLastName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (String value) {
                        _instructorLastName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email ID',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _instructorNationalID = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                DatePickerButton(
                  initialText: 'Select Date of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _instructorDateOfBirth = date;
                    });
                  },
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DropdownButtonWidget<String>(
                    items: departments,
                    selectionDescription: 'Select Department',
                    setValue: (String? value) {
                      _instructorDepartment = value!;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MultiSelectDropdownWidget<String>(
                  items: const [
                    'math_1',
                    'math_2',
                    'math_3',
                    'math_4',
                    'math_5',
                    'math_6',
                    'math_7',
                    'math_8',
                  ],
                  selectionDescription: 'Instructor courses',
                  setValues: (List<String>? values) {
                    _instructorCourses = values;
                    //print('Selected Values: $values');
                  },
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Add Instructor',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _typeMessage = false;
                    pickExcelFile(_typeMessage!);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add By Excel',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  /// ##################################################################33
  Future<void> showAddStudentDialog() async {
    final _firstNameFormKey = GlobalKey<FormState>();
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Add Student',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Select Student Details:'),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onChanged: (String value) {
                        _studentFirstName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onChanged: (String value) {
                        _studentLastName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        _studentEmailID = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email ID',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        _studentNationalID = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                DatePickerButton(
                  initialText: 'Select Date of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _studentDateOfBirth = date;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),

                DropdownButtonWidget<String>(
                  items: academicYears,
                  selectionDescription: 'Select Academic Year',
                  setValue: (String? value) {
                    _studentAcademicYear =yearMap[value] ;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DropdownButtonWidget<String>(
                    items: departments,
                    selectionDescription: 'Select Department',
                    setValue: (String? value) {
                      _studentDepartment = value!;
                    },
                  ),
                ),
                const SizedBox(height: 6),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
                const Text('Select Parent Details:'),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onChanged: (String value) {
                        _parentFirstName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onChanged: (String value) {
                        _parentLastName = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (String value) {
                        _parentEmailID = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Email ID',
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onChanged: (String value) {
                        _parentNationalID = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )),
                DatePickerButton(
                  initialText: 'Select Date of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _parentDateOfBirth = date;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                BlocProvider(
                    create: (context) => StudentCubit(
                        studentRepository: StudentRepository(
                            studentWebServices: StudentWebServices())),
                    child: Builder(builder: (context) {
                      final studentCubit = context.read<StudentCubit>();

                      return TextButton(
                        onPressed: () {
                          final parent = Parent(
                              firstName: _parentFirstName,
                              lastName: _parentLastName,
                              emailId: _parentEmailID,
                              nationalId: _parentNationalID,
                              dateOfBirth: _parentDateOfBirth);
                          final student = Student(
                              studyYear:_studentAcademicYear ,
                              adminId: 1,
                              firstName: _studentFirstName,
                              lastName: _studentLastName,
                              emailId: _studentEmailID,
                              dateOfBirth: _studentDateOfBirth,
                              nationalId: _studentNationalID,
                              department: _studentDepartment,
                              parentDto: parent);
                          studentCubit.printjson(student);
                        },
                        child: const Text(
                          'Add Student',
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    })),
                TextButton(
                  onPressed: () {
                    _typeMessage = true;
                    pickExcelFile(_typeMessage!);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add By Excel',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void pickExcelFile(bool message) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      print("Selected file path: $filePath");
      // Check if the selected file has a valid Excel extension
      if (filePath.toLowerCase().endsWith('.xlsx') ||
          filePath.toLowerCase().endsWith('.xls')) {
        print("Selected file is an Excel file.");
        File selectedFile = File(filePath);
        await sendFile(selectedFile);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: message
                ? const Text(' successfully loaded add student')
                : const Text(' successfully loaded add instructor'),
            duration: const Duration(seconds: 4),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Selected file is not a valid Excel file."),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No file selected."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> sendFile(File file) async {
    var url = 'https://example.com/upload';

    try {
      Dio dio = Dio();

      // Create a FormData object to send the file
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      // Send the POST request with the FormData
      Response response = await dio.post(
        url,
        data: formData,
      );

      // Check the response status
      if (response.statusCode == 200) {
        print('File uploaded successfully');
      } else {
        print('File upload failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error uploading file: $error');
    }
  }

  void printVariables() {
    print('_courseCode: $_parentFirstName');
    print('_startTime: $_parentLastName');
    print('_endTime: $_studentNationalID');
    print('_hallLocation: $_studentDepartment');
    print('_courseName: $_studentDateOfBirth');
    print('_term: $_studentAcademicYear');
    print('_groupName: $_studentLastName');
    print('_instructorName: $_studentEmailID');
    print('_courseDescription: $_parentEmailID');
  }
}
