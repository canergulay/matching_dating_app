import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/components/utils/loading_dialoger.dart';
import '../../domain/usecases/verify_send_sms.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  final SendVerificationSMS sendVerificationSMS;
  final VerifySMSCode verifySMSCode;

  PhoneVerificationCubit({required this.sendVerificationSMS, required this.verifySMSCode})
      : super(PhoneVerificationState(countryCode: "TR", isButtonActive: false));
  final FocusNode focusNode = FocusNode();
  void changeCountryCode(PhoneVerificationState state) {
    emit(state);
  }

  void buttonOn() {
    final PhoneVerificationState currentState = state;
    emit(PhoneVerificationState(countryCode: currentState.countryCode, isButtonActive: true));
  }

  void sendMessage(BuildContext context) {
    focusNode.unfocus();
    ProgressIndicator.instance.showLoadingIndicator(context);

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
  }
}

class PhoneVerificationState {
  final String countryCode;
  final bool isButtonActive;
  PhoneVerificationState({required this.countryCode, required this.isButtonActive});
}
