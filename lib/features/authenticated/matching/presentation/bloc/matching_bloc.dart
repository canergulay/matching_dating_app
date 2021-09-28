import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:matchangoo/core/appetizers/global_models/location.dart';
import 'package:matchangoo/core/components/dialogs/show_dialog_methods/show_location_dialog.dart';
import 'package:matchangoo/core/components/toasts/toasts_onhand.dart';
import 'package:matchangoo/core/init/get_them_all/get_it_container.dart';
import 'package:matchangoo/core/result_error/errors/custom_error.dart';
import 'package:matchangoo/core/result_error/result_freezed/result.dart';
import 'package:matchangoo/features/Identification/data/models/interests/interests.dart';
import 'package:matchangoo/features/authenticated/matching/configuration/swipe_direction_enum.dart';
import 'package:matchangoo/features/authenticated/matching/data/models/user.dart';
import 'package:matchangoo/features/authenticated/matching/domain/usecases/load_missing_location.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_users_cubit.dart';
import 'package:matchangoo/features/authentication/authentication_control/bloc/authentication_bloc.dart';
import 'package:meta/meta.dart';

import 'dummies_to_be_deleted/a_few_dummy_data.dart';
part 'matching_event.dart';
part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  final LoadMissingLocation loadMissingLocation;
  final CandidateUsersCubit candidateUsersCubit;
  MatchingBloc({required this.loadMissingLocation, required this.candidateUsersCubit}) : super(MatchingInitial());

  @override
  Stream<MatchingState> mapEventToState(
    MatchingEvent event,
  ) async* {
    if (event is MatchingSwiped) {
      final SwipeDirection swipeDirection = event.swipeDirection;
      yield* _swiped(swipeDirection);
    }
  }

  Future<void> _fetchInitialCards() async {
    await Future.delayed(Duration(seconds: 2));
    emit(MatchingLoaded(matchingList: usersToMatch));
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
        loadMissingLocation(location);
        _fetchInitialCards();
      }, error: (CustomError error) {
        showGetLocationDialog(context);
      });
    } else {
      // THIS BLOCK REPRESENT THE SITUATION THAT USER PRESSED BACK BUTTON AND POP THE DIALOG, OUR RESULT IS NULL
      _tryToGetLocation(context);
      // FANTASTIC, WE HAVE JUST CREATED A PARADOX, A RECURSIVE FUNCTION THAT WORKS IN AN INFINITE LOOP.
    }
  }

  Stream<MatchingState> _swiped(SwipeDirection direction) async* {
    yield* _discardForemostCard();
  }

  Stream<MatchingState> _discardForemostCard() async* {
    print((state as MatchingLoaded).matchingList.length);
    final List<User> users = (state as MatchingLoaded).matchingList;
    users.removeAt(0);

    yield MatchingLoaded(matchingList: users);
    print((state as MatchingLoaded).matchingList.length);
  }
}
