import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/components/utils/loading_dialoger.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  PhoneVerificationCubit(PhoneVerificationState initial) : super(initial);
  final FocusNode focusNode = FocusNode();
  void changeCountryCode(PhoneVerificationState state) {
    emit(state);
  }

  void buttonOn() {
    final PhoneVerificationState currentState = state;
    emit(PhoneVerificationState(countryCode: currentState.countryCode, isButtonActive: true));
  }

  void sendMessage(BuildContext context) {
    print('sendid!');
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
