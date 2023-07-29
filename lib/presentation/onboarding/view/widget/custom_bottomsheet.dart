import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../domain/models.dart';
import '../../../resources/assets_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/constans_manager.dart';
import '../../../resources/values_manager.dart';
import '../../viewmodel/onboarding_viewmodel.dart';
import 'proper_circle.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key, required this.sliderViewObject, required this.pageController, required this.viewModel});
  final SliderViewObject sliderViewObject;
    final PageController pageController ;
  final OnBoardingViewModel viewModel  ;
  @override
  Widget build(BuildContext context) {
    return    Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: () {
                pageController.animateToPage(viewModel.goPrevious(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              },
            ),
          )

          // circle indicator

          // right arrow
          ,
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: ProperCircle(
                    index: i,
                    currentIndex: sliderViewObject.currentIndex,
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: () {
                pageController.animateToPage(viewModel.goNext(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimationTime),
                    curve: Curves.bounceInOut);
              },
            ),
          )
        ],
      ),
    );
 
  }
}
