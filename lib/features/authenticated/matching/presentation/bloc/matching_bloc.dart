import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:matchangoo/features/authenticated/matching/configuration/swipe_direction_enum.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/dummy_user_list.dart';
import 'package:meta/meta.dart';
part 'matching_event.dart';
part 'matching_state.dart';

class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  MatchingBloc() : super(MatchingInitial()) {
    fetchCards();
  }
  @override
  Stream<MatchingState> mapEventToState(
    MatchingEvent event,
  ) async* {
    if (event is MatchingSwiped) {
      final SwipeDirection swipeDirection = event.swipeDirection;
      swiped(swipeDirection);
    }
  }

  Future<void> fetchCards() async {
    await Future.delayed(Duration(seconds: 2));
    emit(MatchingLoaded(matchingList: dummyUserList));
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
