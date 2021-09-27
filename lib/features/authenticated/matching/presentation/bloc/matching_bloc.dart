import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/components/dialogs/show_dialog_methods/show_location_dialog.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/authenticated/matching/configuration/swipe_direction_enum.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/dummy_user_list.dart';
import 'package:matchangoo/features/authentication/authentication_control/bloc/authentication_bloc.dart';
import 'package:meta/meta.dart';
part 'matching_event.dart';
part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  final BuildContext homeContext;
  MatchingBloc(this.homeContext) : super(MatchingInitial());

  @override
  Stream<MatchingState> mapEventToState(
    MatchingEvent event,
  ) async* {
    if (event is MatchingSwiped) {
      final SwipeDirection swipeDirection = event.swipeDirection;
      swiped(swipeDirection);
    }
  }

  Future<void> _fetchInitialCards() async {
    await Future.delayed(Duration(seconds: 2));
    emit(MatchingLoaded(matchingList: dummyUserList));
  }

  void checkIfWeGotTheLocation(BuildContext context) {
    final Location? location = (sl.get<AuthenticationBloc>().state as AuthenticationAuthenticated).user?.location;

    if (location?.coordinates.length == 2) {
      _fetchInitialCards();
    } else {
      _tryToGetLocation(context);
    }
  }

  Future<void> _tryToGetLocation(BuildContext context) async {
    final Result<Location>? locationResult = await showGetLocationDialog(context, dismissable: false);
    if (locationResult != null) {
      locationResult.when(success: (Location location) {
        (sl.get<AuthenticationBloc>().state as AuthenticationAuthenticated).user?.setLocation(location);
        // TODO : LOAD MISSING LOCATION WITH USERID TOKEN INFO.
        _fetchInitialCards();
      }, error: (CustomError error) {
        print('error geldi');
        showGetLocationDialog(context);
      });
    } else {
      // THIS BLOCK REPRESENT THE SITUATION THAT USER PRESSED BACK BUTTON AND POP THE DIALOG, OUR RESULT IS NULL
      _tryToGetLocation(context);
      // FANTASTIC, WE HAVE JUST CREATED A PARADOX, A RECURSIVE FUNCTION THAT WORKS IN AN INFINITE LOOP.
    }
  }

  Future<void> swiped(SwipeDirection direction) async {
    await Future.delayed(Duration(seconds: 1));
    discardForemostCard();
    print("Direction is " + direction.toString());
  }

  void discardForemostCard() {
    emit(MatchingLoaded(matchingList: List.of((state as MatchingLoaded).matchingList)..removeLast()));
  }
}
