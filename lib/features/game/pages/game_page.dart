import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/item.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/texts/text_r.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.level});

  final int level;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  ValueNotifier<int> hearts = ValueNotifier(3);

  bool isClick = false;
  bool canTap = false;

  void onStar(int firstIndex, int secondIndex) async {
    if (hearts.value < 1) return;
    if (items[firstIndex][secondIndex].value.done) return;
    if (isClick) return;
    if (firstIndex == remember.value?.first &&
        secondIndex == remember.value?.last) return;
    isClick = true;
    items[firstIndex][secondIndex].value =
        items[firstIndex][secondIndex].value.copyWith(visible: true);
    if (remember.value == null) {
      remember.value = [firstIndex, secondIndex];
    } else if (items[remember.value!.first][remember.value!.last].value.id ==
        items[firstIndex][secondIndex].value.id) {
      items[remember.value!.first][remember.value!.last].value =
          items[remember.value!.first][remember.value!.last]
              .value
              .copyWith(done: true);
      items[firstIndex][secondIndex].value =
          items[firstIndex][secondIndex].value.copyWith(done: true);

      addCoins(10);
      countCorrect.value += 2;
      remember.value = null;
    } else {
      await Future.delayed(const Duration(milliseconds: 400));
      items[remember.value!.first][remember.value!.last].value =
          items[remember.value!.first][remember.value!.last]
              .value
              .copyWith(visible: false);
      items[firstIndex][secondIndex].value =
          items[firstIndex][secondIndex].value.copyWith(visible: false);

      hearts.value--;
      addCoins(-1);
      remember.value = null;
    }
    isClick = false;
  }

  @override
  void initState() {
    super.initState();
    setupLevel();
  }

  ValueNotifier<List<int>?> remember = ValueNotifier(null);
  ValueNotifier<int> countCorrect = ValueNotifier(0);
  ValueNotifier<bool> isRemember = ValueNotifier(false);
  List<List<ValueNotifier<Item>>> items = [];

  setupLevel() async {
    var cacheList = getLevelData();
    cacheList.addAll(getLevelData());
    cacheList.shuffle();
    Size size = getCountItems();
    int count = 0;
    for (int i = 0; i < size.height; i++) {
      List<ValueNotifier<Item>> matrix = [];
      for (int j = 0; j < size.width; j++) {
        matrix.add(ValueNotifier(cacheList[count]));
        logger((cacheList[count] as Item).id);
        count++;
      }
      items.add(matrix);
    }
    for (var element in items) {
      for (var element2 in element) {
        element2.value = element2.value.copyWith(visible: true);
      }
    }
    await Future.delayed(const Duration(seconds: 5));

    canTap = true;

    for (var element in items) {
      for (var element2 in element) {
        element2.value = element2.value.copyWith(visible: false);
      }
    }
  }

  getLevelData() {
    switch (widget.level) {
      case 1:
        return itemsList1.toList();
      case 2:
        return itemsList2.toList();
      case 3:
        return itemsList3.toList();
      case 4:
        return itemsList4.toList();
      case 5:
        return itemsList5.toList();
      case 6:
        return itemsList6.toList();
      default:
        return [];
    }
  }

  Size getCountItems() {
    switch (widget.level) {
      case 1:
        return const Size(4, 3);
      case 2:
        return const Size(4, 4);
      case 3:
        return const Size(5, 4);
      case 4:
        return const Size(6, 4);
      case 5:
        return const Size(6, 5);
      case 6:
        return const Size(6, 6);
      default:
        return const Size(0, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScaffold(
      id: getBg(widget.level),
      body: Stack(
        children: [
          _Level(widget.level),
          Positioned(
            top: 47 + getStatusBar(context),
            left: 15,
            child: ValueListenableBuilder(
              valueListenable: coinsData,
              builder: (context, value, child) {
                return TextB('Pontuação: $value', fontSize: 18);
              },
            ),
          ),
          Positioned(
            top: 47 + getStatusBar(context),
            right: 15,
            child: ValueListenableBuilder(
              valueListenable: hearts,
              builder: (context, value, child) {
                return Row(
                  children: [
                    if (hearts.value == 1) ...[
                      const _Diamond(),
                    ] else if (hearts.value == 2) ...[
                      const _Diamond(),
                      const SizedBox(width: 10),
                      const _Diamond(),
                    ] else if (hearts.value == 3) ...[
                      const _Diamond(),
                      const SizedBox(width: 10),
                      const _Diamond(),
                      const SizedBox(width: 10),
                      const _Diamond()
                    ],
                  ],
                );
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: countCorrect,
            builder: (context, value, child) {
              var countItems = getCountItems();
              var total = countItems.width * countItems.height;
              if (value == total.toInt()) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const TextB("Grande vitória!", fontSize: 36),
                      SizedBox(
                        width: size.width * .7,
                        height: 100,
                        child: const Text(
                          "Você conseguiu coletar todos os pares da combinação",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: Fonts.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      PrimaryButton(
                        title: 'Próximo nível', // keyingi daraja
                        onPressed: () {
                          if (widget.level >= 6) {
                            context.pop();
                          } else if (widget.level < 6) {
                            context.pop();
                            context.push('/game', extra: (widget.level + 1));
                          }
                        },
                      ),
                      PrimaryButton(
                        title: 'Tente novamente', // qayta urinish
                        onPressed: () {
                          context.pop();
                          context.push('/game', extra: (widget.level));
                        },
                      ),
                    ],
                  ),
                );
              }
              return ValueListenableBuilder(
                valueListenable: hearts,
                builder: (context, value, child) {
                  if (value < 1) {
                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextB("Game Over!", fontSize: 36),
                          SizedBox(
                            width: size.width * .7,
                            // height: 100,
                            child: const Text(
                              "Tente a sorte novamente!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: Fonts.bold,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 74),
                          PrimaryButton(
                            title: 'Try Again',
                            onPressed: () {
                              context.pop();
                              context.push('/game', extra: (widget.level));
                            },
                          )
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            items.length,
                            (firstIndex) {
                              var item = items[firstIndex];
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  item.length,
                                  (index) {
                                    return ValueListenableBuilder(
                                      valueListenable: item[index],
                                      builder: (context, value, child) {
                                        return ValueListenableBuilder(
                                          valueListenable: remember,
                                          builder: (context, value2, child) {
                                            return _Star(
                                              onPressed: canTap
                                                  ? () {
                                                      onStar(firstIndex, index);
                                                    }
                                                  : null,
                                              item: value,
                                              isVisible:
                                                  value.visible || value.done,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: PrimaryButton(
              title: 'Salão',
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Level extends StatelessWidget {
  const _Level(this.level);

  final int level;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 13 + getStatusBar(context)),
        Image.asset(
          'assets/girl.png',
          height: 112,
        ),
        SizedBox(
          height: 44,
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset('assets/level_title.svg'),
              ),
              Center(
                child: TextB('Nível $level', fontSize: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Diamond extends StatelessWidget {
  const _Diamond();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/diamond2.png',
      height: 30,
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({
    this.onPressed,
    required this.item,
    this.isVisible = false,
  });

  final Item item;
  final bool isVisible;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        height: 56,
        width: 56,
        child: Stack(
          children: [
            SvgPicture.asset('assets/star.svg'),
            Center(
              child: Image.asset(
                isVisible ? "${item.asset}.png" : 'assets/star.png',
                height: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
