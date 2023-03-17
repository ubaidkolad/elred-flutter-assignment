import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class IconWithCircularBorder extends StatelessWidget {
  final Color borderColor;
  final double radius;
  final double iconSize;
  const IconWithCircularBorder(
      {Key? key,
      required this.borderColor,
      this.radius = 24,
      this.iconSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
      ),
      child: CircleAvatar(
        maxRadius: radius,
        backgroundColor: Colors.transparent,
        child: Icon(
          Icons.design_services_outlined,
          color: Theme.of(context).primaryColorLight,
          size: iconSize,
        ),
      ),
    );
  }
}
