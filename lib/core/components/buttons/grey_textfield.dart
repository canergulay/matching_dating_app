import 'package:flutter/material.dart';

import '../../ui/theme/palette.dart';
import '../../structure/utils/extensions/context_extension.dart';

Container textFieldContainerWithPrefix(
    {required BuildContext context,
    required String hintText,
    required TextInputType textInputType,
    TextInputAction textInputAction = TextInputAction.done,
    required Function(String) onChanged,
    bool erroneus = false,
    required IconData preffixIcon,
    bool obscure = false}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: erroneus ? Palette.buttonRed.withOpacity(0.25) : Palette.TEXTFIELDGREY,
    ),
    margin: EdgeInsets.only(top: context.heightUnit * 2),
    child: TextField(
        obscureText: obscure,
        textInputAction: textInputAction,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.2, color: Palette.BIZIMBLACK, fontWeight: FontWeight.w500),
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(4),
          alignLabelWithHint: false,
          prefixIcon: Icon(
            preffixIcon,
            color: Colors.black45,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          ),
        )),
  );
}

Container textFieldContainer(
    {required BuildContext context,
    bool autoFocus = false,
    required String hintText,
    required FocusNode focusNode,
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
        autofocus: autoFocus,
        buildCounter: (_, {required currentLength, maxLength, required isFocused}) => null,
        maxLength: maxLength,
        textAlign: textAlign,
        focusNode: focusNode,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.2, color: Palette.BIZIMBLACK, fontWeight: FontWeight.w500),
        onChanged: onChanged,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16),
          hintText: hintText,
          alignLabelWithHint: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          ),
        )),
  );
}

Container textFieldContainerWController(
    {required BuildContext context,
    bool autoFocus = false,
    required String hintText,
    required FocusNode focusNode,
    required TextEditingController controller,
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
        autofocus: autoFocus,
        buildCounter: (_, {required currentLength, maxLength, required isFocused}) => null,
        maxLength: maxLength,
        textAlign: textAlign,
        focusNode: focusNode,
        controller: controller,
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
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.black38, width: 0.5),
          ),
        )),
  );
}
