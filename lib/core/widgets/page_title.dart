import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'texts/text_r.dart';

class PageTitle extends StatelessWidget {
  const PageTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Stack(
        children: [
          Center(
            child: SvgPicture.asset('assets/page_title.svg'),
          ),
          Align(
            alignment: Alignment.center,
            child: TextB(title, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
