import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/core/constants/error_constants.dart';
import 'package:matchangoo/core/init/local/local_manager.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authentication/login/data/models/user.dart';
import 'package:matchangoo/features/authentication/login/domain/usecases/get_usermodel.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetUserByToken getUserByToken;
  AuthenticationBloc({required this.getUserByToken}) : super(AuthenticationLoading()) {
    print('bura');
    checkIfUserAuthenticated();
  }

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is Authenticate) {
      yield AuthenticationAuthenticated(user: event.user);
    } else if (event is Logout) {
      yield AuthenticationNotAuthenticated();
    }
  }

  Future<void> checkIfUserAuthenticated() async {
    final String? token = await LocalManager.instance.get(boxName: 'user', key: 'token');
    if (token == null) {
      emit(AuthenticationNotAuthenticated());
    } else {
      final Result<UserModel?> userResult = await getUserByToken(token);
      userResult.when(success: (UserModel? user) {
        emit(AuthenticationAuthenticated(user: user));
      }, error: (CustomError error) {
        return AuthenticationNotAuthenticated();
      });
    }
  }
}
