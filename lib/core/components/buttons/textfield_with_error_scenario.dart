import 'package:flutter/material.dart';
import 'package:matchangoo/core/appetizers/customtypes/bool_returnerW_text_parameter.dart';
import 'package:matchangoo/core/ui/theme/palette.dart';
import 'package:matchangoo/core/structure/utils/extensions/context_extension.dart';

class TextFieldContainerWController extends StatefulWidget {
  final bool autoFocus;
  final String hintText;

  final TextEditingController controller;
  final int maxLength;
  final TextAlign textAlign;
  final TextStyle hintStyle;
  final BoolReturnerWithTextParameter errorRule;
  final TextInputType textInputType;
  final Function(String) onChanged;
  const TextFieldContainerWController(
      {Key? key,
      this.autoFocus = false,
      required this.hintText,
      required this.controller,
      this.maxLength = 999999,
      this.textAlign = TextAlign.center,
      this.hintStyle = const TextStyle(),
      required this.textInputType,
      required this.errorRule,
      required this.onChanged})
      : super(key: key);

  @override
  _TextFieldContainerWControllerState createState() => _TextFieldContainerWControllerState();
}

class _TextFieldContainerWControllerState extends State<TextFieldContainerWController> {
  bool isProblematic = false;

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.errorRule(widget.controller.text)) {
        notProblematic();
      } else {
        problematic();
      }
    });
    // TODO: implement initState
    super.initState();
  }

  void problematic() {
    setState(() {
      isProblematic = true;
    });
  }

  void notProblematic() {
    setState(() {
      isProblematic = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isProblematic ? Palette.buttonRed.withOpacity(0.5) : Palette.TEXTFIELDGREY,
      ),
      margin: EdgeInsets.only(top: context.heightUnit * 1),
      child: TextField(
          autofocus: widget.autoFocus,
          buildCounter: (_, {required currentLength, maxLength, required isFocused}) => null,
          maxLength: widget.maxLength,
          textAlign: widget.textAlign,
          controller: widget.controller,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(fontSize: context.widthUnit * 4, color: Palette.BIZIMBLACK, fontWeight: FontWeight.w500),
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: context.widthUnit * 3.99999),
            hintText: widget.hintText,
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
}
