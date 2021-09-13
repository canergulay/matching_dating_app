import 'package:flutter/material.dart';
import 'degree_type_list.dart';

import '../../../widgets/keep_alive.dart';
import '../sections/i_am_a.dart';
import '../sections/interested_in.dart';
import '../sections/profession.dart';
import '../sections/interest/interests.dart';
import '../sections/whats_your_birth.dart';
import '../sections/whats_your_name.dart';
import '../utils/focusnode_supplier.dart';

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
