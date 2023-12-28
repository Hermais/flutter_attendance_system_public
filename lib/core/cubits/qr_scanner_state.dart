part of 'qr_scanner_cubit.dart';

@immutable
abstract class QrScannerState {}

class QrScannerInitial extends QrScannerState {}
class QrScannerScanned extends QrScannerState {
  final String qrCode;
  QrScannerScanned({required this.qrCode});
}
class QrScannerPosting extends QrScannerState {}
class QrScannerIdle extends QrScannerState {}
class QrPostSuccess extends QrScannerState {}
class QrPostFailure extends QrScannerState {}
