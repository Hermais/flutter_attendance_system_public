import 'package:google_fonts/google_fonts.dart';

/// Web service constants
const maxDuration = Duration(seconds: 20);
const exampleBaseURL = 'https://jsonplaceholder.typicode.com';

const developerAdmin = '/developerAdmin';

const facultyAdmin = '/facultyAdmin';
const adminTimetables = '/facultyAdmin/adminTimetables';
const prepYear = 'Preparatory';
const year1 = 'Year 1';
const year2 = 'Year 2';
const year3 = 'Year 3';
const year4 = 'Year 4';

const yearMap = {
  prepYear: 0,
  year1: 1,
  year2: 2,
  year3: 3,
  year4: 4,
};

const days = [
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Saturday'
];

const academicYears = [prepYear, year1, year2, year3, year4];

const departments = [
  'Physics and Engineering Mathematics',
  'Mechanical Design and Manufacturing',
  'Industrial Engineering',
  'Materials Engineering',
  'Computer and Systems Engineering',
  'Environmental Engineering',
  'Electronics and Electrical Communications Engineering',
  'Power Engineering and Electrical Machines',
  'Mechanical Power Engineering',
  'Construction and Facilities Engineering',
  'Water Engineering and Water Facilities',
  'Architecture',
  'Structural Engineering'
];

const instructor = '/instructor';
const instructorStudentsByApplicableCourses =
    '/instructor/studentsByApplicableCourses';
const student = '/student';
const parent = '/parent';

/// Theme constants
final appTextTheme = GoogleFonts.latoTextTheme();
