import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/utils/onboard_text.dart';

class SportsHobbiesInterests extends StatelessWidget {
  const SportsHobbiesInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 3, vertical: context.heightUnit * 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          onBoardText('Sports', context),
          Container(),
          onBoardText('Hobbies', context),
          onBoardText('Interest Areas', context),
        ],
      ),
    );
  }
}
