part of 'matching_bloc.dart';

@immutable
abstract class MatchingEvent {}

class MatchingSwiped extends MatchingEvent {
  final SwipeDirection swipeDirection;
  MatchingSwiped({required this.swipeDirection});
}
