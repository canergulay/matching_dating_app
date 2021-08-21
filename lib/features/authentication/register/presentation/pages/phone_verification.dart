import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InternationalPhoneNumberInput(
          selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG),
          onInputChanged: (PhoneNumber number) {
            print(number.dialCode);
            print(number.phoneNumber);
            print(number.dialCode);
          },
        ),
      ),
    );
  }
}
