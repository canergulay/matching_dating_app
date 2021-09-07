import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:matchangoo/features/Identification/data/models/profession/degree_types.dart';

class DegreesRepo {
  List<DegreeType> degreeList = [
    DegreeType(code: 'hs'),
    DegreeType(code: 'ugrad'),
    DegreeType(code: 'grad'),
    DegreeType(code: 'doctor'),
  ];

  List<DropdownMenuItem<DegreeType>> degreeItems(BuildContext context) {
    return degreeList.map((DegreeType type) => DropdownMenuItem<DegreeType>(value: type, child: dropDownText(type.code))).toList();
  }

  Text dropDownText(String code) => Text(code.tr());
}
