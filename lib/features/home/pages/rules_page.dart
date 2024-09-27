import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../widgets/diamond_widget.dart';

class RulesPage extends StatelessWidget {
  const RulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40 + getStatusBar(context)),
            const PageTitle('Regras'),
            const SizedBox(height: 20),
            Container(
              height: 170,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.white20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  TextB(
                    'Você tem que coletar pares de elementos escondidos sob as cartas',
                    fontSize: 16,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DiamondWidget(),
                      SizedBox(width: 20),
                      DiamondWidget(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 130,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.white20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                children: [
                  TextB(
                    'Você ganha pontos para cada\ncombinação bem-sucedida',
                    fontSize: 16,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  TextB('Pontuação: 10', fontSize: 40),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 160,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.white20,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const TextB(
                    'Se você falhar, perderá seus corações extras. Sua oferta é limitada. Quando eles acabarem, o jogo acabou',
                    fontSize: 16,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/diamond2.png',
                        height: 50,
                      ),
                      const SizedBox(width: 18),
                      Image.asset(
                        'assets/diamond2.png',
                        height: 50,
                      ),
                      const SizedBox(width: 18),
                      Image.asset(
                        'assets/diamond2.png',
                        height: 50,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Salão',
              onPressed: () {
                context.pop();
              },
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
