import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/appetizers/textfield_rules/email_password_rule.dart';

class EmailPasswordErrorState {
  final bool isEmailErroneus;
  final bool isPasswordErroneus;
  final String? emailWarning;
  final String? passwordWarning;
  EmailPasswordErrorState({required this.isEmailErroneus, required this.isPasswordErroneus, this.emailWarning, this.passwordWarning});
}

class EmailPasswordErrorCubit extends Cubit<EmailPasswordErrorState> {
  late String email = '';
  late String password = '';

  EmailPasswordErrorCubit() : super(EmailPasswordErrorState(isEmailErroneus: false, isPasswordErroneus: false));

  void checkErrorStatus() {
    final ControlStatus emailControlStatus = emailControl(email: email);
    final ControlStatus passwordControlStatus = passwordControl(password: password);

    final bool isEmailErroneus = !(emailControlStatus == ControlStatus.valid);
    final bool isPasswordErroneus = !(passwordControlStatus == ControlStatus.valid);

    emit(EmailPasswordErrorState(
        isEmailErroneus: isEmailErroneus,
        isPasswordErroneus: isPasswordErroneus,
        emailWarning: emailWarningMessage(emailControlStatus),
        passwordWarning: passwordWarningMessage(passwordControlStatus)));
  }

  String? emailWarningMessage(ControlStatus status) {
    if (status == ControlStatus.empty) {
      return "ERROR.EMAIL.EMPTY".tr();
    } else if (status == ControlStatus.notvalid) {
      return "ERROR.EMAIL.NOTVALID".tr();
    }
  }

  String? passwordWarningMessage(ControlStatus status) {
    if (status == ControlStatus.empty) {
      return "ERROR.PASSWORD.EMPTY".tr();
    } else if (status == ControlStatus.long) {
      return "ERROR.PASSWORD.LONG".tr();
    } else if (status == ControlStatus.short) {
      return "ERROR.PASSWORD.SHORT".tr();
    }
  }

  bool isButtonOpen() => !state.isEmailErroneus && !state.isPasswordErroneus && email.isNotEmpty && password.isNotEmpty;
}
