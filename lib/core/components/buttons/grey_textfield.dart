import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../ui/theme/palette.dart';
import '../../structure/utils/extensions/context_extension.dart';
import 'package:matchangoo/features/authentication/register/presentation/bloc/register_bloc.dart';

Container textFieldContainerWithPrefix(
    {required BuildContext context, required String hintText, required TextInputType textInputType, required Function(String) onChanged}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Palette.TEXTFIELDGREY,
    ),
    margin: EdgeInsets.only(top: context.heightUnit * 4),
    child: TextField(
        style:
            Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: context.widthUnit * 4, color: Palette.BIZIMBLACK, fontWeight: FontWeight.w500),
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: context.widthUnit * 3.99999),
          hintText: hintText,
          alignLabelWithHint: false,
          prefixIcon: Icon(
            Icons.mail_outline_outlined,
            color: Colors.black45,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
        )),
  );
}

Container textFieldContainer(
    {required BuildContext context,
    required bool autoFocus,
    required String hintText,
    int maxLength = 999999,
    TextAlign textAlign = TextAlign.center,
    TextStyle hintStyle = const TextStyle(),
    required TextInputType textInputType,
    required Function(String) onChanged}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Palette.TEXTFIELDGREY,
    ),
    margin: EdgeInsets.only(top: context.heightUnit * 1),
    child: TextField(
        buildCounter: (_, {required currentLength, maxLength, required isFocused}) => null,
        maxLength: maxLength,
        textAlign: textAlign,
        style:
            Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: context.widthUnit * 4, color: Palette.BIZIMBLACK, fontWeight: FontWeight.w500),
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: context.widthUnit * 3.99999),
          hintText: hintText,
          alignLabelWithHint: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black38, width: 0.5),
          ),
        )),
  );
}
