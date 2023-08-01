import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/model/models.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import '../../viewmodel/onboarding_viewmodel.dart';
import 'custom_bottomsheet.dart';
import 'onboarding_page.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key, required this.sliderViewObject, required this.pageController, required this.viewModel});
  final SliderViewObject? sliderViewObject;
    final PageController pageController ;
 final OnBoardingViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark),
        ),
        body: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              viewModel.onPageChanged(index);
            },
            itemCount: sliderViewObject!.numOfSlides,
            itemBuilder: (context, index) {
              return OnBoardingPage(sliderViewObject!.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
              // widgets indicator and arrows
              CustomBottomSheet(
                sliderViewObject: sliderViewObject!,
                viewModel: viewModel,
                pageController: pageController,
              )
            ],
          ),
        ),
      );
    }
  }
}
