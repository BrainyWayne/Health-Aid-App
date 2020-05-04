import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class GradientIcon extends StatelessWidget {
  final Widget icon;
  Gradient gradient;

  GradientIcon({this.icon, this.gradient}) {
    if (gradient == null) {
      gradient = Gradients.coldLinear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      child: icon,
      shaderCallback: (bounds) => gradient.createShader(bounds),
    );
  }
}
