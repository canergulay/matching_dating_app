import 'package:flutter/material.dart';
import 'package:matchangoo/core/constants/asset_paths.dart';

class SmallAnimatedIcon extends StatefulWidget {
  final String assetPath;
  final double scale;
  final VoidCallback onTap;

  const SmallAnimatedIcon({
    Key? key,
    required this.assetPath,
    required this.scale,
    required this.onTap,
  }) : super(key: key);

  @override
  State<SmallAnimatedIcon> createState() => _SmallAnimatedIconState();
}

class _SmallAnimatedIconState extends State<SmallAnimatedIcon> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(lowerBound: 1, upperBound: 2, vsync: this, duration: const Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () async {
            await _animationController.forward().then((value) => _animationController.reverse());
            widget.onTap();
          },
          child: Transform.scale(
            scale: 1 / _animationController.value,
            child: Image.asset(widget.assetPath, scale: widget.scale),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

SmallAnimatedIcon xCloseButton(
  BuildContext context,
) {
  return SmallAnimatedIcon(
    assetPath: AssetPaths.shared.DELPHOTO,
    onTap: () {
      Navigator.of(context).pop('result is bu!');
    },
    scale: 1.7,
  );
}
