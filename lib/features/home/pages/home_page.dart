import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/reward_dialog.dart';
import '../widgets/settings_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void checkReward() async {
    final prefs = await SharedPreferences.getInstance();
    int lastReward = prefs.getInt('lastReward') ?? 0;

    if ((lastReward + 86400) < getCurrentTimestamp()) {
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return const RewardDialog();
          },
        );
      }
    } else {
      logger(getCurrentTimestamp() - lastReward);
    }
  }

  @override
  void initState() {
    super.initState();
    checkReward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 26 + getStatusBar(context)),
          Image.asset(
            'assets/logo.png',
            width: 300,
          ),
          const Spacer(),
          const Row(
            children: [
              Spacer(),
              SettingsButton(),
              SizedBox(width: 40),
            ],
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            title: 'Novo jogo',
            onPressed: () {
              context.push('/level');
            },
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            title: 'Regras',
            onPressed: () {
              context.push('/rules');
            },
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
