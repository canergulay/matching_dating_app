import 'package:flutter/material.dart';

import '../../../widgets/keep_alive.dart';
import '../sections/first_section.dart';
import '../sections/second_section.dart';
import '../sections/whats_your_birth.dart';
import '../sections/whats_your_name.dart';

class IdentificationRepo {
  List<Widget> identificationPages() {
    return [
      KeepAlivePage(child: WhatIsYourName()),
      KeepAlivePage(child: WhenIsYourBirthday()),
      KeepAlivePage(child: FirstSection()),
      KeepAlivePage(child: SecondSection()),
    ];
  }
}
