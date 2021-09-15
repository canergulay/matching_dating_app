import 'package:email_validator/email_validator.dart';

bool emailPassController({required String email, required String password}) {
  return EmailValidator.validate(email) && passWordValidator(password);
}

bool passWordValidator(String password) {
  return password.length > 3 && password.length < 20;
}
