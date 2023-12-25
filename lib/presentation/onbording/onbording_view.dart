import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mf_course/domain/view_models/models.dart';
import 'package:mf_course/presentation/onbording/view_model/onbording_viewmodel.dart';
import 'package:mf_course/presentation/resources/assest_manger.dart';
import 'package:mf_course/presentation/resources/color_manger.dart';
import 'package:mf_course/presentation/resources/route_manger.dart';
import 'package:mf_course/presentation/resources/strings_manager.dart';
import 'package:mf_course/presentation/resources/values_manger.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  final OnbordingViewModel _viewModel = OnbordingViewModel();
  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnbordingViewObj>(
        stream: _viewModel.onbordingViewOutput,
        builder: (context, snapshot) { 
          if (!snapshot.hasData) {
            return const SizedBox();
          }
          return onbordingBody(snapshot.data);
        });
  }

  Scaffold onbordingBody(OnbordingViewObj? onbordingViewObj) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.white,
        elevation: SizeManger.s0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark),
      ),
      body: PageView.builder(
          onPageChanged: (index) {
            _viewModel.getCurrentPage(index: index);
          },
          controller: _viewModel.pageController,
          itemCount: _viewModel.onbordingItems.length,
          itemBuilder: (context, index) =>
              OnbordingPageView(onbordingViewObj!.onbordingObj)),
      bottomSheet: _bottomSheet(currentIndex: onbordingViewObj!.currentIndex),
    );
  }

  Widget _bottomSheet({required int currentIndex}) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, RouteName.loginView),
                child: Text(
                  StringsManager.skip,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )),
          const SizedBox(
            height: SizeManger.s12,
          ),
          Container(
            height: SizeManger.s50,
            width: double.infinity,
            color: ColorManger.primary,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizeManger.s12),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        _viewModel.animateToPage(
                            page: _viewModel.previousPgae());
                      },
                      child: SvgPicture.asset(AssetManager.leftArrow)),
                  const Spacer(),
                  for (var index = 0;
                      index < _viewModel.onbordingItems.length;
                      index++)
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: SizeManger.s8),
                      child: _getCircleIndicator(
                          index: index, currentIndex: currentIndex),
                    ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        _viewModel.animateToPage(
                            page: _viewModel.forwordPage());
                      },
                      child: SvgPicture.asset(AssetManager.rightArrow)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCircleIndicator({required int index, required int currentIndex}) {
    {
      if (currentIndex == index) {
        return SvgPicture.asset(AssetManager.solidCircle);
      }
      return SvgPicture.asset(AssetManager.hollowCircle);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnbordingPageView extends StatefulWidget {
  final OnbordingObj _onbordingObj;
  const OnbordingPageView(this._onbordingObj, {super.key});

  @override
  State<OnbordingPageView> createState() => _OnbordingPageViewState();
}

class _OnbordingPageViewState extends State<OnbordingPageView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: PaddingManger.p40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget._onbordingObj.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: SizeManger.s12,
          ),
          Text(
            widget._onbordingObj.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: SizeManger.s20,
          ),
          SvgPicture.asset(widget._onbordingObj.image)
        ],
      ),
    );
  }
}
