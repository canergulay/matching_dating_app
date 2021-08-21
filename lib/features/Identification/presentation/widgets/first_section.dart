import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matchangoo/core/constants/design_constants.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/Identification/presentation/widgets/gender_button.dart';

Container firstSection(BuildContext context) => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'I am a ',
            style: Theme.of(context).textTheme.headline3,
          ),
          iamA(context),
          Text(
            'Interested in',
            style: Theme.of(context).textTheme.headline3,
          ),
          lookingFor(context)
        ],
      ),
    );

Container iamA(BuildContext context) {
  return Container(
      padding: EdgeInsets.all(context.lowValue),
      decoration: BoxDecoration(
          color: Colors.pink.withOpacity(0.2),
          borderRadius: BorderRadius.circular(
            DesignConstant.borderRadiusALL,
          )),
      child: DropdownButton<String>(
        hint: Text('Gender'),
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Row(
              children: [
                Icon(Icons.ac_unit),
                SizedBox(width: 10),
                Text(value),
              ],
            ),
          );
        }).toList(),
        onChanged: (_) {
          print(_);
        },
      ));
}

Container lookingFor(BuildContext context) => Container(
      padding: EdgeInsets.only(left: context.widthUnit * 10, right: context.widthUnit * 10),
      child: Row(
        children: [
          Expanded(child: GenderButton(image: 'assets/images/icons/man.png')),
          SizedBox(
            width: 10,
          ),
          Expanded(child: GenderButton(image: 'assets/images/icons/woman.png')),
        ],
      ),
    );
