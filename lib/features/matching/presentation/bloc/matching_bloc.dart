import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'matching_event.dart';
part 'matching_state.dart';
class MatchingBloc extends Bloc<MatchingEvent, MatchingState> {
  MatchingBloc() : super(MatchingInitial());
  @override
  Stream<MatchingState> mapEventToState(
    MatchingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
