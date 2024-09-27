import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../texts/text_r.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44 + 14,
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: SvgPicture.asset('assets/primary_button.svg'),
            ),
            Align(
              alignment: Alignment.center,
              child: TextB(title, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
