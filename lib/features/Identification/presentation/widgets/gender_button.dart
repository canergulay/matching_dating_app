import 'package:flutter/material.dart';
import '../../../../core/constants/design_constants.dart';
import '../../../../core/structure/utils/extensions/context_extension.dart';
import '../../../../core/ui/theme/palette.dart';

class GenderButton extends StatefulWidget {
  final String image;
  GenderButton({Key? key, required this.image}) : super(key: key);

  @override
  _GenderButtonState createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
        });
      },
      child: Container(
        height: context.widthUnit * 25,
        padding: EdgeInsets.all(context.widthUnit * 3),
        decoration: BoxDecoration(
            color: isClicked ? Palette.softPink : Colors.transparent, borderRadius: BorderRadius.circular(DesignConstant.borderRadiuslow)),
        child: Image.asset(
          widget.image,
        ),
      ),
    );
  }
}
