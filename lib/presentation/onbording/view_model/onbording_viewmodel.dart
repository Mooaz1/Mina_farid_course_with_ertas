import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mf_course/domain/view_models/models.dart';
import 'package:mf_course/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../resources/assest_manger.dart';
import '../../resources/strings_manager.dart';

class OnbordingViewModel extends BaseViewModel
    implements OnbordingInpuEvents, OnbordingOutputEvents {
  final PageController _pageController = PageController();
  final StreamController _onbordingStreamController =
      BehaviorSubject<OnbordingViewObj>();
  late final List<OnbordingObj> _onbordingItems;
  int _currentIndex = 0;
 
  PageController get pageController => _pageController;
  List<OnbordingObj> get onbordingItems => _onbordingItems;

  @override
  void dispose() {
     _pageController.dispose();
  }

  @override
  void start() {
    _onbordingItems = _getOnbordingList();
    _fetchOnbordingData();
  }

  // private functions
  List<OnbordingObj> _getOnbordingList() {
    return [
      OnbordingObj(
          title: StringsManager.onBoardingTitle1,
          subTitle: StringsManager.onBoardingSubTitle1,
          image: AssetManager.onboardingLogo1),
      OnbordingObj(
          title: StringsManager.onBoardingTitle2,
          subTitle: StringsManager.onBoardingSubTitle2,
          image: AssetManager.onboardingLogo2),
      OnbordingObj(
          title: StringsManager.onBoardingTitle3,
          subTitle: StringsManager.onBoardingSubTitle3,
          image: AssetManager.onboardingLogo3),
      OnbordingObj(
          title: StringsManager.onBoardingTitle4,
          subTitle: StringsManager.onBoardingSubTitle4,
          image: AssetManager.onboardingLogo4),
    ];
  }

  _fetchOnbordingData() {
    onbordingViewInput.add(OnbordingViewObj(
        currentIndex: _currentIndex,
        pagesCount: _onbordingItems.length,
        onbordingObj: _onbordingItems[_currentIndex]));
  }

  @override
  animateToPage({required int page}) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  int forwordPage() {
    int forwordPage = ++_currentIndex;
    if (forwordPage == _onbordingItems.length) {
      forwordPage = 0;
    }
    return forwordPage;
  }

  @override
  int previousPgae() {
    int previousPage = --_currentIndex;
    if (previousPage == -1) {
      previousPage = _onbordingItems.length - 1;
    }
    return previousPage;
  }

  @override
  Sink get onbordingViewInput => _onbordingStreamController.sink;

  @override
  Stream<OnbordingViewObj> get onbordingViewOutput =>
      _onbordingStreamController.stream
          .map((onbordingViewObj) => onbordingViewObj);

  @override
  getCurrentPage({required int index}) {
    _currentIndex = index;
    _fetchOnbordingData();
  }
}

abstract class OnbordingInpuEvents {
  getCurrentPage({required int index}); // get current page
  animateToPage(
      {required int page}); // allow page controller to animate to the next page
  int forwordPage(); // go to the next page
  int previousPgae(); // go to the previous page

  Sink get onbordingViewInput;
}

abstract class OnbordingOutputEvents {
  Stream<OnbordingViewObj> get onbordingViewOutput;
}
