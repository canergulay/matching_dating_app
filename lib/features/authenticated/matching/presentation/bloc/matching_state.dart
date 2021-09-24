part of 'matching_bloc.dart';

@immutable
abstract class MatchingState {}

class MatchingInitial extends MatchingState {}

class MatchingLoaded extends MatchingState {
  final List<String> matchingList;
  MatchingLoaded({required this.matchingList});
}
