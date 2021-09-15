import 'package:flutter/material.dart';
import 'package:matchangoo/core/components/buttons/grey_textfield.dart';

class ObscureDynamicTextfield extends StatefulWidget {
  final Function(String) onChanged;
  final TextInputType textInputType;
  final String hintText;
  final bool erroneus;
  final IconData preffixIcon;
  const ObscureDynamicTextfield(
      {Key? key, this.erroneus = false, required this.onChanged, required this.textInputType, required this.hintText, required this.preffixIcon})
      : super(key: key);

  @override
  _ObsecureDynamicTextfieldState createState() => _ObsecureDynamicTextfieldState();
}

class _ObsecureDynamicTextfieldState extends State<ObscureDynamicTextfield> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        textFieldContainerWithPrefix(
            context: context,
            obscure: isObscure,
            hintText: widget.hintText,
            erroneus: widget.erroneus,
            textInputType: widget.textInputType,
            onChanged: widget.onChanged,
            preffixIcon: widget.preffixIcon),
        Positioned(
            right: 0,
            bottom: 5,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: obscureIcon()))
      ],
    );
  }

  Icon obscureIcon() => Icon(isObscure ? Icons.remove_red_eye_outlined : Icons.remove_red_eye_rounded);
}
