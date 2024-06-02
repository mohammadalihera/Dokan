import 'dart:io';
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnection {
  NetworkConnection._internal() {
    initialize();
  }

  static bool hasConnection = false;

  static final _connectionStream = StreamController.broadcast();
  static final NetworkConnection _instance = NetworkConnection._internal();

  static NetworkConnection get instance {
    return _instance;
  }

  static final Connectivity _connectivity = Connectivity();

  void initialize() {
    _connectivity.onConnectivityChanged.listen(_connectionChange);
    checkConnection();
  }

  Stream get connectionChange => _connectionStream.stream;

  void dispose() {
    _connectionStream.close();
  }

  void _connectionChange(ConnectivityResult result) {
    checkConnection();
  }

  static Future<bool> checkConnection() async {
    bool _previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    } on TimeoutException catch (e) {
      hasConnection = false;
    }

    if (_previousConnection != hasConnection) {
      _connectionStream.add(hasConnection);
    }

    return hasConnection;
  }
}
