import 'package:email_validator/email_validator.dart';

bool emailPassController({required String email, required String password}) {
  return EmailValidator.validate(email) && passWordValidator(password);
}

bool passWordValidator(String password) {
  return password.length >= 3 && password.length <= 20;
}

ControlStatus passwordControl({required String password}) {
  if (password.isEmpty) {
    return ControlStatus.empty;
  } else if (password.length < 3) {
    return ControlStatus.short;
  } else if (password.length > 20) {
    return ControlStatus.long;
  } else {
    return ControlStatus.valid;
  }
}

ControlStatus emailControl({required String email}) {
  if (email.isEmpty) {
    return ControlStatus.empty;
  } else if (!EmailValidator.validate(email)) {
    return ControlStatus.notvalid;
  } else {
    return ControlStatus.valid;
  }
}

enum ControlStatus { empty, notvalid, short, long, valid }
