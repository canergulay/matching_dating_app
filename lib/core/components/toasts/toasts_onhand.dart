import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:matchangoo/core/appetizers/enums.dart/toast_type_enum.dart';
import 'package:matchangoo/core/components/toasts/toast_manager.dart';
import 'package:matchangoo/core/components/toasts/toast_widgets.dart/general_toast.dart';

void showErrorToast(BuildContext context, {required String title, required String message}) {
  ToastShower.instance.showMyToast(context, GeneralToast(title: title, message: message, type: ToastType.bad));
}

void showGeneralErrorToast(BuildContext context) {
  ToastShower.instance.showMyToast(context, GeneralToast(title: 'ERROR.TITLES.ONE'.tr(), message: 'ERROR.MESSAGES.ONE'.tr(), type: ToastType.bad));
}
