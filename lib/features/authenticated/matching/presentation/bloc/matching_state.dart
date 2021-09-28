part of 'matching_bloc.dart';

@immutable
abstract class MatchingState {}

class MatchingInitial extends MatchingState {}

class MatchingLoaded extends MatchingState {
  final List<User> matchingList;
  MatchingLoaded({required this.matchingList});
}
