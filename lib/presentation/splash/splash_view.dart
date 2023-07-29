import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tutapp/presentation/resources/color_manager.dart';
import 'package:tutapp/presentation/resources/constans_manager.dart';
import 'package:tutapp/presentation/resources/routes_manager.dart';

import '../resources/assets_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body:
          const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
