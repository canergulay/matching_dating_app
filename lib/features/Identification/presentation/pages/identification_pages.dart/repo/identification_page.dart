import 'package:flutter/material.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/sections/profession.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/sections/sports_hobbies_interests.dart';
import 'package:matchangoo/features/Identification/presentation/pages/identification_pages.dart/utils/focusnode_supplier.dart';

import '../../../widgets/keep_alive.dart';
import '../sections/i_am_a.dart';
import '../sections/interested_in.dart';
import '../sections/whats_your_birth.dart';
import '../sections/whats_your_name.dart';

class IdentificationRepo {
  List<Widget> identificationPages() {
    return [
      KeepAlivePage(child: WhatIsYourName()),
      KeepAlivePage(
          child: WhenIsYourBirthday(
        focusNoder: FocusNoder(),
      )),
      KeepAlivePage(child: FirstSection()),
      KeepAlivePage(child: SecondSection()),
      KeepAlivePage(child: Profession()),
      KeepAlivePage(child: SportsHobbiesInterests()),
    ];
  }
}
