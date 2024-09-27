import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/page_title.dart';
import '../../../core/widgets/texts/text_r.dart';

class RewardDialog extends StatefulWidget {
  const RewardDialog({super.key});

  @override
  State<RewardDialog> createState() => _RewardDialogState();
}

class _RewardDialogState extends State<RewardDialog> {
  List<int> values = [0, 20, 50];
  bool rewarded = false;
  int rewardedValue = 0;

  void onGift(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('lastReward', getCurrentTimestamp());
    addCoins(value);
    logger(value);
    setState(() {
      rewarded = true;
      rewardedValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    values.shuffle();
    values.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        height: 256,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 234,
                width: 332,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff0E0E0E),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xffB40101),
                      blurRadius: 54,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 48),
                    if (rewarded) ...[
                      Expanded(
                        child: Stack(
                          children: [
                            Image.asset('assets/giftellipse.png'),
                            Image.asset('assets/giftstar.png'),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 27,
                              child: SvgPicture.asset(
                                'assets/giftbox.svg',
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: TextB(
                                '+$rewardedValue pontos',
                                fontSize: 18,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )
                    ] else ...[
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 40,
                        ),
                        child: TextB(
                          'Abra a caixa e descubra o que você ganhou!',
                          fontSize: 18,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _GiftButton(
                            value: values[0],
                            onPressed: onGift,
                          ),
                          const SizedBox(width: 34),
                          _GiftButton(
                            value: values[1],
                            onPressed: onGift,
                          ),
                          const SizedBox(width: 34),
                          _GiftButton(
                            value: values[2],
                            onPressed: onGift,
                          ),
                        ],
                      ),
                      const SizedBox(height: 27),
                    ],
                  ],
                ),
              ),
            ),
            const PageTitle('Recompensa diária'),
          ],
        ),
      ),
    );
  }
}

class _GiftButton extends StatelessWidget {
  const _GiftButton({
    required this.value,
    required this.onPressed,
  });

  final int value;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onPressed(value);
      },
      padding: EdgeInsets.zero,
      child: SvgPicture.asset('assets/giftbox.svg'),
    );
  }
}
