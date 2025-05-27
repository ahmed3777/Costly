import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  bool _isConnected = true;
  AwesomeDialog? _dialog;

  static const String _title = 'No Internet Connection';
  static const String _description = 'Please check your internet connection and try again.';
  static const String _retryText = 'Retry';

  bool get isConnected => _isConnected;

  Future<void> initialize(BuildContext context) async {
    _isConnected = await checkConnection();

    _connectivity.onConnectivityChanged.listen((results) {
      _isConnected = _hasInternet(results);

      if (!_isConnected) {
        _showNoConnectionDialog(context);
      } else {
        _dialog?.dismiss();
      }
    });
  }

  bool _hasInternet(List<ConnectivityResult> results) {
    return results.any((r) => r != ConnectivityResult.none);
  }

  Future<bool> checkConnection() async {
    final results = await _connectivity.checkConnectivity();
    return _hasInternet(results);
  }

  void _showNoConnectionDialog(BuildContext context) {
    _dialog?.dismiss();

    _dialog = AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: _title,
      desc: _description,
      btnOkText: _retryText,
      btnOkColor: Colors.red,
      btnOkOnPress: () async {
        final loadingDialog = AwesomeDialog(
          context: context,
          dialogType: DialogType.noHeader,
          animType: AnimType.bottomSlide,
          body: const Center(child: CircularProgressIndicator()),
        )..show();

        final connected = await checkConnection();
        loadingDialog.dismiss();

        if (!connected) {
          _showNoConnectionDialog(context);
        }
      },
    )..show();
  }
}
