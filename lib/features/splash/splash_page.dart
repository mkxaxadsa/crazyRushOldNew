import 'package:flutter/material.dart';
import 'package:project26/core/utils.dart';

import '../../core/config/router.dart';
import '../../core/widgets/custom_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void load() async {
    await getData().then((value) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (mounted) context.go('/home');
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 300,
        ),
      ),
    );
  }
}
