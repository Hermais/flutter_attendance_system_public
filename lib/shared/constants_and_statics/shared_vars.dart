import 'package:google_fonts/google_fonts.dart';

/// Web service constants
const maxDuration = Duration(seconds: 30);
const exampleBaseURL = 'https://qr-attendance-system.onrender.com';


const prepYear = 'Preparatory';
const year1 = 'Year 1';
const year2 = 'Year 2';
const year3 = 'Year 3';
const year4 = 'Year 4';
const qrCodeDellimeter = '^';

const yearMap = {
  prepYear: 0,
  year1: 1,
  year2: 2,
  year3: 3,
  year4: 4,
};


const days = [
  'Friday',
  'Saturday',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
];

const academicYears = [prepYear, year1, year2, year3, year4];

const departments = [
  'Preparatory',
  'Physics and Engineering Mathematics',
  'Mechanical Design and Manufacturing',
  'Industrial Engineering',
  'Materials Engineering',
  'Computer and Systems',
  'Environmental Engineering',
  'Electronics and Electrical Communications',
  'Electrical Power',
  'Mechanical Power Engineering',
  'Construction and Facilities Engineering',
  'Water Engineering and Water Facilities',
  'Architecture',
  'Structural Engineering'
];



const instructor = '/instructor';
const showStudentsOfInstructor =
    '/instructor/studentsByApplicableCourses';
const student = '/student';
const parent = '/parent';
const developerAdmin = '/developerAdmin';
const facultyAdmin = '/facultyAdmin';
const adminTimetables = '/facultyAdmin/adminTimetables';

/// Theme constants
final appTextTheme = GoogleFonts.latoTextTheme();
