import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  late StreamSubscription connectivitySubscription;
  var firstTime = true;
  var isConnected = true;


  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    monitorInternetConnection();
  }

  StreamSubscription<ConnectivityResult> monitorInternetConnection() {
    return connectivitySubscription =
        connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none && isConnected) {
        print("Internet: Disconnected");
        isConnected = !isConnected;
        emit(InternetDisconnected());
      } else if (firstTime) {
        firstTime = false;
      }else if (result != ConnectivityResult.none && !isConnected){
        print("Internet: Connected");
        isConnected = !isConnected;
        emit(InternetConnected());
      }
    });
  }

  @override
  Future<void> close() {
    connectivitySubscription.cancel();
    return super.close();
  }
}
