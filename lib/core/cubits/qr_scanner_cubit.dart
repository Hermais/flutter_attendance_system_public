import 'package:bloc/bloc.dart';
import 'package:flutter_attendance_system/core/data/models/attendance_post_model.dart';
import 'package:flutter_attendance_system/main.dart';
import 'package:meta/meta.dart';

import '../data/services/instructor_web_services.dart';

part 'qr_scanner_state.dart';

class QrScannerCubit extends Cubit<QrScannerState> {
  InstructorWebServices instructorWebServices;
  QrScannerCubit({required this.instructorWebServices}) : super(QrScannerInitial());

  void openQrScanner() {
    emit(QrScannerIdle());
  }
  void catchQrCode(String qrCode) {
    customPrint(qrCode);
    Attendance attendance = Attendance(
        lectureId: int.parse(qrCode.split('^')[0]),
        studentEmail: qrCode.split('^')[1]);
    customPrint(attendance.toJson().toString());
    emit(QrScannerScanned(qrCode: qrCode));
    postAttendance(attendance);

  }

  void postAttendance(Attendance attendance){
    instructorWebServices.postAttendance(attendance).then((value) {
      if(value == 'Attendance marked successfully.'){
        emit(QrPostSuccess());
      }else{
        emit(QrPostFailure());
      }
    });

  }
}
