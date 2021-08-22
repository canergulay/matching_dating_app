import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/first_section.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/keep_alive.dart';

class IdentificationCubit extends Cubit<int> {
  IdentificationCubit() : super(0);

  final PageController pageController = PageController(initialPage: 0);

  List<Widget> identificationPages(BuildContext context) {
    return [
      KeepAlivePage(child: firstSection(context)),
      KeepAlivePage(child: firstSection(context)),
      KeepAlivePage(child: firstSection(context)),
      KeepAlivePage(child: firstSection(context)),
    ];
  }

  int pageKeepTrack = 0;

  void onPageChanged(int page) {
    page > pageKeepTrack ? goToNext() : goToPrevious();
    page > pageKeepTrack ? pageKeepTrack++ : pageKeepTrack--;
  }

  void goToNext() {
    emit(state + 1);
  }

  void goToPrevious() {
    emit(state - 1);
  }

  void getPrevious() {
    if (state != 0) {
      pageController.animateToPage(state - 1, duration: Duration(milliseconds: 450), curve: Curves.easeInOutBack);
    }
  }

  double containerWidth(BuildContext context) => (context.width - context.widthUnit * 6) / identificationPages(context).length * (state + 1);
}
