import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/first_section.dart';
import 'package:meta/meta.dart';
part 'identification_event.dart';
part 'identification_state.dart';

class IdentificationBloc extends Bloc<IdentificationEvent, IdentificationState> {
  IdentificationBloc() : super(IdentificationInitial());

  List<Widget> identificationPages(BuildContext context) {
    return [firstSection(context)];
  }

  @override
  Stream<IdentificationState> mapEventToState(
    IdentificationEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
