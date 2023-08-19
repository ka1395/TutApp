import 'package:flutter/material.dart';
import 'package:tutapp/app/app_preferences.dart';
import 'package:tutapp/app/di.dart';

import '../../../domain/model/models.dart';

import '../viewmodel/onboarding_viewmodel.dart';
import 'widget/onboarding_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  OnBoardingViewModel viewModel = OnBoardingViewModel();

  final AppPreferences _appPreferences = instance<AppPreferences>();
    @override
  void initState() {
    viewModel.start();
    _appPreferences.setOnBoardingScreenViewed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return OnBoardingBody(
          sliderViewObject: snapshot.data,
          pageController: _pageController,
          viewModel: viewModel,
        );
      },
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }
}
