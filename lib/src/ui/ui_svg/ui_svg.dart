import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
class UISvg extends StatefulWidget {
  final String? svg;
  final double? width;
  final double? height;
  const UISvg({super.key, this.svg, this.width, this.height});

  @override
  State<UISvg> createState() => _UISvgState();
}

class _UISvgState extends State<UISvg> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      widget.svg!,
      width: widget.width,
      height: widget.height,
    );
  }
}
