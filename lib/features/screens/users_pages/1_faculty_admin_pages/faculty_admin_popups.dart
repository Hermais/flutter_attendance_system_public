import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';

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
  String? _studentDateOfBirth;
  String? _studentFirstName;
  String? _studentLastName;
  String? _studentUniversityID;
  String? _studentNationalID;
  String? _studentAcademicYear;
  String? _studentDepartment;
  String? _parentID;
  String? _parentFirstName;
  String? _parentLAstName;
  String? _parentDateOfBirth;
  String? _instructorDateOfBirth;
  String? _instructorFirstName;
  String? _instructorLastName;
  String? _instructorUniversityID;
  String? _instructorNationalID;
  String? _instructorDepartment;
  List<String>? _instructorCourses;
  bool? _isFloatingActionButtonVisible;
  bool? _typeMessage;
  String? _lectureStartDate;
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
                DatePickerButton(selectedDate: "Select Start Date",

                  setChangedDate: (String? value) {
                    _lectureStartDate = value!;
                  },),
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
                    onPressed: (){
                      showAddInstructorDialog();
                    },
                    child:const Text(
                      'Add Instructor',
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextButton(
                    onPressed: (){
                      showAddStudentDialog();
                    },
                    child:const Text(
                      'Add Student',
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child:const Text(
                      'Cancel',
                      style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Future<void> showAddInstructorDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Add Instructor',
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _instructorFirstName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _instructorLastName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _instructorUniversityID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'University ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _instructorNationalID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                DatePickerButton(
                  selectedDate: 'Select Date of Birth',
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
                const SizedBox(height: 10,),
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
                  selectionDescription: ' Assign Instructor courses',
                  setValues: (List<String>? values) {
                    _instructorCourses=values;
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
                  onPressed: () {
                  },
                  child: const Text('Add Instructor',style: TextStyle(fontSize: 11),),
                ),
                TextButton(
                  onPressed: () {
                    _typeMessage=false;
                    pickExcelFile(_typeMessage!);
                    Navigator.pop(context);
                  },
                  child: const Text('Add By Excel',style: TextStyle(fontSize: 11),),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel',style: TextStyle(fontSize: 11),),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
  Future<void> showAddStudentDialog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Student',
            style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Select Student Details:'),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _studentFirstName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _studentLastName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _studentUniversityID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'University ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _studentNationalID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'National ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                DatePickerButton(
                  selectedDate: 'Select Date of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _studentDateOfBirth = date;
                    });
                  },
                ),
                const SizedBox(height: 10,),
                DropdownButtonWidget<String>(
                  items: academicYears,
                  selectionDescription: 'Select Academic Year',
                  setValue: (String? value) {
                    _studentAcademicYear = value!;
                  },
                ),
                const SizedBox(height: 10,),
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
                const SizedBox(height:6),
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
                      onFieldSubmitted: (String value) {
                        _studentFirstName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (String value) {
                        _studentLastName=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Icons.text_format,
                        ),
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (String value) {
                        _parentID=value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Parent ID',
                        prefixIcon: Icon(
                          Icons.numbers_sharp,
                        ),
                      ),
                    )
                ),
                const SizedBox(height: 10,),
                DatePickerButton(
                  selectedDate: 'Select Date of Birth',
                  setChangedDate: (date) {
                    setState(() {
                      _parentDateOfBirth = date;
                    });
                  },
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          actions: [
            Row(
                children: [

                  TextButton(
                    onPressed: () {
                    },
                    child: const Text('Add Student',style: TextStyle(fontSize: 12),),
                  ),
                  TextButton(
                    onPressed: () {
                      _typeMessage=true;
                      pickExcelFile(_typeMessage!);
                      Navigator.pop(context);
                    },
                    child: const Text('Add By Excel',style: TextStyle(fontSize: 12),),
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
      if (filePath.toLowerCase().endsWith('.xlsx') || filePath.toLowerCase().endsWith('.xls')) {
        print("Selected file is an Excel file.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: message ? const Text(' successfully loaded add student') :const Text(' successfully loaded add instructor'),
            duration: const Duration(seconds: 4),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(  "Selected file is not a valid Excel file."),
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

  void printVariables() {
    print('_courseCode: $_courseCode');
    print('_startTime: $_startTime');
    print('_endTime: $_endTime');
    print('_hallLocation: $_hallLocation');
    print('_courseName: $_courseName');
    print('_term: $_term');
    print('_groupName: $_groupName');
    print('_instructorName: $_instructorName');
    print('_courseDescription: $_courseDescription');
  }
}