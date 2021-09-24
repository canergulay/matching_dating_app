import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/bloc/matching_bloc.dart';
import 'package:matchangoo/features/authenticated/matching/presentation/widgets/animated_user_card.dart';
//import 'package:vector_math/vector_math_64.dart' as vector;

class UsersStacked extends StatelessWidget {
  UsersStacked({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchingBloc, MatchingState>(
      builder: (context, state) {
        if (state is MatchingInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final List<String> matchingList = (state as MatchingLoaded).matchingList;

          return AnimatedUserCard(
            userImage: matchingList[matchingList.length - 1],
            isFirstCard: isFirstCard(lengthOfList: matchingList.length, myIndex: matchingList.length),
          );
        }
      },
    );
  }
}

bool isFirstCard({required int lengthOfList, required int myIndex}) {
  return lengthOfList - 1 == myIndex || lengthOfList - 1 == myIndex - 1;
}
