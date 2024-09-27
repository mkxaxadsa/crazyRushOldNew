import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiamondWidget extends StatelessWidget {
  const DiamondWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      width: 78,
      child: Stack(
        children: [
          SvgPicture.asset('assets/diamond.svg'),
          Image.asset('assets/diamond.png'),
        ],
      ),
    );
  }
}
