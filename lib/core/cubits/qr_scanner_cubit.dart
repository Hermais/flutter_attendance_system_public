import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qr_scanner_state.dart';

class QrScannerCubit extends Cubit<QrScannerState> {
  QrScannerCubit() : super(QrScannerInitial());

  void openQrScanner() {
    emit(QrScannerIdle());
  }
  void catchQrCode(String qrCode) {
    print('QR Code: $qrCode');
    emit(QrScannerScanned(qrCode: qrCode));
  }
}
