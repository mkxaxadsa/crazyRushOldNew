import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/texts/text_r.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({
    super.key,
    required this.level,
    required this.active,
    this.price = 0,
  });

  final int level;
  final bool active;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: active ? const Color(0xff590000) : const Color(0xff595959),
          borderRadius: BorderRadius.circular(20),
        ),
        child: CupertinoButton(
          onPressed: active
              ? () {
                  context.push('/game', extra: level);
                }
              : null,
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: active ? 100 : 64,
                width: active ? 100 : 64,
                padding: EdgeInsets.all(active ? 12 : 4),
                decoration: BoxDecoration(
                  color: active
                      ? const Color(0xffFF0000)
                      : const Color(0xff6C6C6C),
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(active ? 0 : 20),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      active ? Colors.transparent : const Color(0xff6C6C6C),
                      BlendMode.color,
                    ),
                    child: Image.asset('assets/level$level.png'),
                  ),
                ),
              ),
              const Spacer(),
              TextB('Nível $level', fontSize: 18),
              const Spacer(),
              TextB(
                active ? 'Livre' : '$price pontos',
                fontSize: 12,
              ),
              const Spacer(),
              if (!active) ...[
                _OpenButton(
                  price: price,
                  onPressed: (p0) {},
                ),
              ],
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _OpenButton extends StatelessWidget {
  const _OpenButton({
    required this.price,
    required this.onPressed,
  });

  final int price;
  final void Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onPressed(price);
      },
      padding: EdgeInsets.zero,
      child: SvgPicture.asset('assets/open_button.svg'),
    );
  }
}
