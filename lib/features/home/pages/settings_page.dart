import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/page_title.dart';
import '../../../core/widgets/texts/text_r.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool sound = false;

  void onSound() async {
    final prefs = await SharedPreferences.getInstance();
    soundData = !soundData;
    sound = soundData;
    prefs.setBool('soundData', sound);
    setState(() {});
  }

  void onReset() async {
    final prefs = await SharedPreferences.getInstance();
    coinsData.value = 0;
    prefs.setInt('coinsData', coinsData.value);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    sound = soundData;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          SizedBox(height: 40 + getStatusBar(context)),
          const PageTitle('Configurações'),
          const SizedBox(height: 20),
          Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white20,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const SizedBox(width: 40),
                const TextB('Som', fontSize: 24),
                const Spacer(),
                CupertinoButton(
                  onPressed: onSound,
                  padding: EdgeInsets.zero,
                  minSize: 42,
                  child: Container(
                    height: 42,
                    width: 82,
                    decoration: BoxDecoration(
                      color: const Color(0xff1C0049).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(42),
                      border: Border.all(
                        width: 2,
                        color: AppColors.white,
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          top: 0,
                          bottom: 0,
                          right: sound ? 3 : 42,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: sound
                                  ? const Color(0xffFF00D6)
                                  : AppColors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 148,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.white20,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Spacer(),
                TextB('Melhor pontuação: ${coinsData.value}', fontSize: 24),
                const Spacer(),
                CupertinoButton(
                  onPressed: onReset,
                  padding: EdgeInsets.zero,
                  child: SvgPicture.asset('assets/reset_button.svg'),
                ),
                const SizedBox(height: 20),
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
    );
  }
}
