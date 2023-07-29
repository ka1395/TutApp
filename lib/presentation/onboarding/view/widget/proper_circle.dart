
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';

class ProperCircle extends StatelessWidget {
  const ProperCircle(
      {super.key, required this.index, required this.currentIndex});
  final int index;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
}
