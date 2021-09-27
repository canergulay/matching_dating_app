import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/enums.dart/dialog_type_enum.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/components/dialogs/error_dialog.dart';
import 'package:matchangoo/core/components/dialogs/get_location_dialog.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';

Future<Result<Location>?> showGetLocationDialog(BuildContext context, {bool dismissable = true}) async =>
    await showDialog(context: context, barrierDismissible: dismissable, builder: (_) => GetLocationDialog(context: context));
