import 'package:bloc/bloc.dart';
import 'package:flutter_attendance_system/core/cubits/lecture_manager_cubit.dart';
import 'package:flutter_attendance_system/core/data/models/attendance_post_model.dart';
import 'package:flutter_attendance_system/main.dart';
import 'package:meta/meta.dart';

import '../../shared/constants_and_statics/shared_vars.dart';
import '../data/services/instructor_web_services.dart';

part 'qr_scanner_state.dart';

class QrScannerCubit extends Cubit<QrScannerState> {
  InstructorWebServices instructorWebServices;
  QrScannerCubit({required this.instructorWebServices}) : super(QrScannerInitial());

  void openQrScanner() {
    emit(QrScannerIdle());
  }
  void catchQrCode(String qrCode, LectureManagerCubit lectureManagerCubit) {
    customPrint(qrCode);
    int lectureId = int.parse(qrCode.split(qrCodeDellimeter)[0]);
    if(lectureId != (lectureManagerCubit.state as LectureManagerInSession).lecture.lectureId){
      emit(QrPostFailure());
      return;
    }
    Attendance attendance = Attendance(
        lectureId: lectureId,
        studentEmail: qrCode.split(qrCodeDellimeter)[1]);
    customPrint(attendance.toJson().toString());
    emit(QrScannerScanned(qrCode: qrCode));
    postAttendance(attendance);

  }

  void postAttendance(Attendance attendance){
    instructorWebServices.postAttendance(attendance).then((value) {
      if(value == 'Attendance marked successfully.'){
        emit(QrPostSuccess());
        emit(QrScannerIdle());
      }else{
        emit(QrPostFailure());
      }
    });

  }
}
