import 'package:flutter/material.dart';

class ProgressIndicator {
  static ProgressIndicator? _instace;
  static ProgressIndicator get instance {
    if (_instace == null) _instace = ProgressIndicator._init();
    return _instace ?? ProgressIndicator._init();
  }

  void showLoadingIndicator(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator.adaptive());
        });
  }

  ProgressIndicator._init();
}
