import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/course_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/instructor_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/student_cubit.dart';
import 'package:flutter_attendance_system/core/data/models/parent_model.dart';
import 'package:flutter_attendance_system/core/data/models/student_model.dart';
import 'package:flutter_attendance_system/core/data/repositories/instructor_repository.dart';
import 'package:flutter_attendance_system/core/data/repositories/lecture_repository.dart';
import 'package:flutter_attendance_system/core/data/repositories/student_repository.dart';
import 'package:flutter_attendance_system/core/data/services/student_web_services.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cubits/halls_cubit.dart';
import '../../../../core/data/models/instructor_model.dart';
import '../../../../core/data/models/lecture_model.dart';
import '../../../../core/data/repositories/course_repository.dart';
import '../../../../core/data/repositories/halls_repository.dart';
import '../../../../core/data/services/course_web_services.dart';
import '../../../../core/data/services/halls_web_services.dart';
import '../../../../core/data/services/instructor_web_services.dart';
import '../../../../core/data/services/lecture_web_services.dart';
import '../../../widgets/drop_down_button.dart';
import '../../../widgets/multi_drop_down_button.dart';
import '../../../widgets/text_button_calendar_viewer.dart';
import '../../../widgets/text_button_clock_viewer.dart';

class FacultyAdminPopups {
  final BuildContext mainContext;
  String? _courseCode;
  DateTime? _startTime;
  DateTime? _endTime;
  String? _hallLocation;
  String? _courseName;
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
  String? _lectureDepartment;
  DateTime? _instructorDateOfBirth;
  String? _instructorFirstName;
  String? _instructorLastName;
  String? _instructorEmailID;
  String? _instructorNationalID;
  List<String>? _instructorCourses;
  bool? _typeMessage;
  DateTime? _lectureStartDate;
  Function setState;

  FacultyAdminPopups({required this.mainContext, required this.setState});

  final lectureCubit = LectureCubit(
      lectureRepository:
      LectureRepository(lectureWebServices: LectureWebServices()));
  final instructorCubit = InstructorCubit(
      instructorRepository:
      InstructorRepository(instructorWebServices: InstructorWebServices()));
  final courseCubit = CourseCubit(
      courseRepository:
      CourseRepository(courseWebServices: CourseWebServices()));
  final hallCubit = HallCubit(
      hallRepository: HallRepository(hallWebServices: HallWebServices()));

  Future<void> showAddLectureDialog() async {
    final multiCubitKey = GlobalKey();

    return await showDialog(
      barrierDismissible: false,
      context: mainContext,
      builder: (BuildContext context) {
        return MultiBlocProvider(
          key: multiCubitKey,
          providers: [
            BlocProvider(
              create: (context) => lectureCubit,
            ),
            BlocProvider(
              create: (context) => instructorCubit,
            ),
            BlocProvider(
              create: (context) => courseCubit,
            ),
            BlocProvider(
              create: (context) => hallCubit,
            ),
          ],
          child: AlertDialog(
            title: const Text('Add Lecture'),
            content: Form(
              child: BlocConsumer<LectureCubit , LectureState>(
                listener: (context, state) {
                  if(state is LecturePostSuccess){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }else if (state is LecturePostError){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: const Duration(seconds: 20),
                      ),
                    );
                  }else if (state is LecturePosting){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Posting Lecture...'),
                        duration: const Duration(seconds: 3),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Pick a department: '),
                      DropdownButtonWidget<String>(
                        items: departments,
                        selectionDescription: 'Select Department',
                        setValue: (String? value) {
                          instructorCubit.loadInstructorByDepartment(value!);
                          courseCubit
                              .loadCourseByDepartmentForLecturePosting(value);
                          hallCubit.loadHalls();

                          _lectureDepartment = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.5,
                      ),
                      const Text('Specify lecture details: '),
                      DatePickerButton(
                        initialText: 'Select Start Date',
                        setChangedDate: (value) {
                          _lectureStartDate = value!;
                        },
                      ),
                      ClockViewerTextButton(
                        setChangedTime: (value) {
                          _startTime = value!;
                        },
                        initialText: 'Select Start Time',
                      ),
                      ClockViewerTextButton(
                        setChangedTime: (value) {
                          _endTime = value!;
                        },
                        initialText: 'Select End Time',
                      ),
                      BlocBuilder<CourseCubit, CourseState>(
                        builder: (context, courseState) {
                          if (courseState is CourseInitial) {
                            return DropdownButtonWidget<String>(
                              items: const [
                                'Specify Department First',
                              ],
                              enabled: false,
                              selectionDescription: 'Specify Department First',
                              setValue: (String? value) {
                                _courseName = value!;
                              },
                            );
                          } else if (courseState is CourseLoaded) {
                            return DropdownButtonWidget<String>(
                              items:courseState.courses
                                  .map((e) => '${e.courseName}')
                                  .toList()
                                  ,
                              selectionDescription: 'Select Course First',
                              setValue: (String? value) {
                                _courseName = value!;
                                // I want to print the id corresponding to the attribute courseName
                                _courseCode = (courseState)
                                    .courses
                                    .firstWhere((element) =>
                                element.courseName == _courseName)
                                    .courseCode;
                                print(_courseCode);
                              },
                            );
                          } else {
                            return DropdownButtonWidget<String>(
                              items: const [
                                'Loading, please, wait...',
                              ],
                              enabled: false,
                              selectionDescription: 'Loading, please, wait...',
                              setValue: (String? value) {
                                _courseName = value!;
                              },
                            );
                          }
                        },
                      ),
                      BlocBuilder<HallCubit, HallsState>(
                        builder: (context, hallsState) {
                          if (hallsState is HallsInitial) {
                            return DropdownButtonWidget<String>(
                              items: const [
                                'Specify Department First',
                              ],
                              enabled: false,
                              selectionDescription: 'Specify Department First',
                              setValue: (String? value) {
                                _hallLocation = value!;
                              },
                            );
                          } else if (hallsState is HallsLoaded) {
                            return DropdownButtonWidget<String>(
                              items:  hallsState.halls.map((e) => e).toList()
                                  ,
                              selectionDescription: 'Select Hall',
                              setValue: (String? value) {
                                _hallLocation = value!;
                              },
                            );
                          } else {
                            return DropdownButtonWidget<String>(
                              items: const [
                                'Loading, please, wait...',
                              ],
                              enabled: false,
                              selectionDescription: 'Loading, please, wait...',
                              setValue: (String? value) {
                                _hallLocation = value!;
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                },
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
                  if (_lectureStartDate == null || _startTime == null ||
                      _endTime == null || _courseCode == null ||
                      _hallLocation == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please, fill all the fields."),
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return;
                  }
                  Lecture lecture = Lecture(
                      firstDate: _lectureStartDate,
                      startTime: _startTime,
                      endTime: _endTime,
                      courseCode: _courseCode,
                      hallLocation: int.parse(_hallLocation!));
                  print(lecture.toJson());
                  lectureCubit.postLecture(lecture);
                },
                child: const Text('Add  lecture'),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> showAddEntitiesDialog() async {
    return await showDialog(
        context: mainContext,
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
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: const Text(
                  //     'Cancel',
                  //     style: TextStyle(fontWeight: FontWeight.w600),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> showAddInstructorDialog() async {
    return await showDialog(
      barrierDismissible: false,
      context: mainContext,
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
                        _instructorEmailID = value;
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
                    selectionDescription: 'Department',
                    setValue: (String? value) {
                      courseCubit
                          .loadCourseByDepartmentForInstructorPosting(value!);

                      _lectureDepartment = value;
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocProvider(
                  create: (context) => courseCubit,
                  child: BlocBuilder<CourseCubit, CourseState>(
                    builder: (context, state) {
                      return MultiSelectDropdownWidget<String>(
                        items: state is CourseLoaded
                            ? state.courses
                            .map((e) => '${e.courseCode}')
                            .toList()
                            : [

                        ],

                        selectionDescription: 'Instructor courses',
                        setValues: (List<String>? values) {
                          _instructorCourses = values;
                          print('Selected Values: $values');
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    final instructor = Instructor(
                        adminId: 1,
                        firstName: _instructorFirstName,
                        lastName: _instructorLastName,
                        emailId: _instructorEmailID,
                        dateOfBirth: _instructorDateOfBirth,
                        nationalId: _instructorNationalID,
                        department: _lectureDepartment,
                        courseCode: _instructorCourses);
                    instructorCubit.postInstructorData(instructor);
                    Navigator.pop(context);
                  },
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

  Future<void> showAddStudentDialog() async {
    return await showDialog(
      barrierDismissible: false,
      context: mainContext,
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
                    _studentAcademicYear = yearMap[value];
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
                    create: (context) =>
                        StudentCubit(
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
                              studyYear: _studentAcademicYear,
                              adminId: 1,
                              firstName: _studentFirstName,
                              lastName: _studentLastName,
                              emailId: _studentEmailID,
                              dateOfBirth: _studentDateOfBirth,
                              nationalId: _studentNationalID,
                              department: _studentDepartment,
                              parentDto: parent);
                          studentCubit.printjson(student);
                          studentCubit.postStudentData(student);
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
        await sendFile(selectedFile, message);
        ScaffoldMessenger.of(mainContext).showSnackBar(
          SnackBar(
            content: message
                ? const Text(' successfully loaded add student')
                : const Text(' successfully loaded add instructor'),
            duration: const Duration(seconds: 4),
          ),
        );
      } else {
        ScaffoldMessenger.of(mainContext).showSnackBar(
          const SnackBar(
            content: Text("Selected file is not a valid Excel file."),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(mainContext).showSnackBar(
        const SnackBar(
          content: Text("No file selected."),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  Future<void> sendFile(File file, bool message) async {
    var url = message
        ? 'https://qr-attendance-system.onrender.com/admin/insert-all-students'
        : 'https://qr-attendance-system.onrender.com/admin/insert-all-instructors';

    try {
      Dio dio = Dio();

      // Create a FormData object to send the file
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path
              .split('/')
              .last,
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
}
