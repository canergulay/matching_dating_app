import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/enums.dart/dialog_type_enum.dart';
import 'package:matchangoo/core/components/dialogs/error_dialog.dart';
import 'package:matchangoo/core/components/dialogs/get_location_dialog.dart';

void showGetLocationDialog(BuildContext context) => showDialog(context: context, builder: (_) => GetLocationDialog(context: context));
