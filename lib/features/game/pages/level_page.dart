import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';
import '../widgets/level_card.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            children: [
              SizedBox(height: 100 + getStatusBar(context)),
              Row(
                children: [
                  const LevelCard(
                    level: 1,
                    active: true,
                  ),
                  const SizedBox(width: 16),
                  ValueListenableBuilder(
                    valueListenable: coinsData,
                    builder: (context, value, child) {
                      return LevelCard(
                        level: 2,
                        active: value > 50,
                        price: 50,
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: coinsData,
                    builder: (context, value, child) {
                      return LevelCard(
                        level: 3,
                        active: value > 80,
                        price: 80,
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  ValueListenableBuilder(
                    valueListenable: coinsData,
                    builder: (context, value, child) {
                      return LevelCard(
                        level: 4,
                        active: value > 120,
                        price: 120,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: coinsData,
                    builder: (context, value, child) {
                      return LevelCard(
                        level: 5,
                        active: value > 150,
                        price: 150,
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  ValueListenableBuilder(
                    valueListenable: coinsData,
                    builder: (context, value, child) {
                      return LevelCard(
                        level: 6,
                        active: value > 200,
                        price: 200,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 100 + getStatusBar(context)),
            ],
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 40 + getStatusBar(context)),
              child: const PageTitle('Selecione o nível'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: PrimaryButton(
                title: 'Salão',
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
