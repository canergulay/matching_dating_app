import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AnimationHelperState {}

class AnimationInitial extends AnimationHelperState {}

class AnimationActivated extends AnimationHelperState {}

class AnimationHelperCubit extends Cubit<AnimationHelperState> {
  void activateAnimation() {}

  AnimationHelperCubit() : super(AnimationInitial());
}
