import 'package:flutter/material.dart';

void getOutOfHere(BuildContext context) {
  FocusScope.of(context).unfocus();
  Navigator.of(context).pop();
}
