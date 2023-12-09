import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Web service constants
const maxDuration = Duration(seconds: 20);
const exampleBaseURL = 'https://rickandmortyapi.com/';

const developerAdmin = '/developerAdmin';
const facultyAdmin = '/facultyAdmin';
const instructor = '/instructor';
const student = '/student';
const parent = '/parent';

/// Theme constants
final appTextTheme = GoogleFonts.latoTextTheme();


const appBarTheme = AppBarTheme(
  backgroundColor: Colors.transparent,
  shape: ContinuousRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(40.0),
      bottomRight: Radius.circular(40.0),
    ),
  ),
);
