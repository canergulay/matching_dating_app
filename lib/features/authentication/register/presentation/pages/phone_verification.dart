import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:matchangoo/core/components/buttons/animated_button.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/phone_verification_cubit.dart';

class PhoneVerification extends StatelessWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhoneVerificationCubit(PhoneVerificationState(countryCode: "TR", isButtonActive: false)),
      child: BlocBuilder<PhoneVerificationCubit, PhoneVerificationState>(
        builder: (context, state) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(left: context.widthUnit * 4, right: context.widthUnit * 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InternationalPhoneNumberInput(
                    focusNode: context.read<PhoneVerificationCubit>().focusNode,
                    onInputValidated: (onay) {
                      print(onay ? 'yeah onay' : 'nope devam');
                      if (onay) {
                        print('evet 123');
                        context.read<PhoneVerificationCubit>().buttonOn();
                      }
                    },
                    autoFocusSearch: true,
                    autoFocus: true,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    formatInput: false,
                    hintText: "Phone Number",
                    initialValue: PhoneNumber(
                      isoCode: state.countryCode,
                    ),
                    errorMessage: 'bir problem var',
                    selectorConfig: SelectorConfig(selectorType: PhoneInputSelectorType.DIALOG, useEmoji: true),
                    onInputChanged: (PhoneNumber number) {
                      context
                          .read<PhoneVerificationCubit>()
                          .changeCountryCode(PhoneVerificationState(countryCode: number.isoCode ?? "TR", isButtonActive: false));
                    },
                  ),
                  SizedBox(
                    height: context.heightUnit * 2,
                  ),
                  state.isButtonActive
                      ? AnimatedButton(
                          title: 'send code',
                          onPressed: () {
                            context.read<PhoneVerificationCubit>().sendMessage(context);
                          })
                      : AnimatedButton(
                          title: 'send code',
                          onPressed: () {},
                          titleColor: Colors.black,
                          buttonColor: Colors.grey,
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
