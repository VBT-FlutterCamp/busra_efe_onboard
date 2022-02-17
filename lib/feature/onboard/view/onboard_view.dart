import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hm_onboard/feature/onboard/model/onboard_model.dart';
import 'package:kartal/kartal.dart';

class OnboardView extends StatefulWidget {
  OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int _currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: context.paddingMedium,
              child: _pageView(context),
            ),
          ),
        ],
      ),
    );
  }

  PageView _pageView(BuildContext context) {
    return PageView.builder(
      itemCount: modelList.length,
      controller: _controller,
      onPageChanged: (int index) {
        setState(() {
          _currentIndex = index;
        });
      },
      itemBuilder: (_, index) {
        return pageBuilder(index, context);
      },
    );
  }

  Column pageBuilder(int index, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          modelList[index].image,
          height: context.height * 0.65,
          width: context.width * 0.9,
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                modelList.length, (index) => navigateList(context, index))),
        SizedBox(
          height: context.dynamicHeight(0.01),
        ),
        Text(
          modelList[index].title,
          style: context.textTheme.headline5?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.appTheme.primaryColor),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: context.dynamicHeight(0.01),
        ),
        Text(modelList[index].description, style: context.textTheme.bodyLarge),
        SizedBox(
          height: context.dynamicHeight(0.02),
        ),
        _navigateButtons(context)
      ],
    );
  }

  Container navigateList(BuildContext context, int index) {
    return Container(
      height: 12,
      width: 12,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
          color: context.appTheme.primaryColor
              .withOpacity(index == _currentIndex ? 1 : 0.5),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
    );
  }

  Row _navigateButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: context.appTheme.primaryColor.withOpacity(0.5)),
            onPressed: () {
              if (_currentIndex != modelList.first) {
                _controller?.previousPage(
                    duration: context.durationLow, curve: Curves.easeIn);
              }
            },
            child: Text(
              'Skip',
            )),
        SizedBox(
          width: context.dynamicWidth(0.035),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: context.appTheme.primaryColor),
            onPressed: () {
              if (_currentIndex != modelList.length - 1) {
                _controller?.nextPage(
                    duration: context.durationLow, curve: Curves.easeIn);
              }
            },
            child: Text('Next'))
      ],
    );
  }
}
