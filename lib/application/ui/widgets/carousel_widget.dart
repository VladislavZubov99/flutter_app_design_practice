import 'dart:ui';

import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/widgets/custom_page_indicator.dart';
import 'package:app/application/ui/widgets/svg_icon_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../resources/resources.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final _boxHeight = 120.0;
  final _items = [
    Colors.blue,
    Colors.orange,
    Colors.green,
  ];
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        height: sy(_boxHeight),
        child: Stack(
          children: <Widget>[
            _buildPageView(),
            _buildCircleIndicator(),
          ],
        ),
      );
    });
  }

  _buildPageView() {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          color: Colors.transparent,
          height: sy(_boxHeight),
          child: PageView.builder(
              scrollBehavior: MyCustomScrollBehavior(),
              itemCount: _items.length,
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: AppSettings.padding,
                    right: AppSettings.padding,
                    bottom: AppSettings.padding,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: sx(AppSettings.padding),
                      vertical: sx(AppSettings.padding)),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff7F51BB),
                        Color(0xff81D4E5),
                      ],
                    ),
                    borderRadius:
                        BorderRadius.circular(sx(AppSettings.borderRadius)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: sx(160),
                        height: sx(180),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              sx(AppSettings.borderRadius)),
                          color: Colors.white.withOpacity(0.33),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Get the special discount',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width <= 620 ? sx(12) : 16),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '50% OFF',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: sx(5),
                                  shadows: const [
                                    Shadow(
                                        color: Colors.black38,
                                        offset: Offset(1, 1),
                                        blurRadius: 5)
                                  ],
                                  fontSize: width <= 620 ? sx(50) : 40,
                                  height: width <= 620 ? sx(1) : 1),
                            )
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Container(
                        child: Stack(
                          children: [
                            // Align(
                            //   alignment: Alignment.centerRight,
                            //   child: Container(
                            //     child: SizedBox(
                            //       width: sx(180),
                            //       height: sx(180),
                            //       child: Image.asset(
                            //         AppImages.runningShoes2,
                            //         color: Colors.black.withOpacity(0.4),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              width: sx(180),
                              height: sx(180),
                              child: ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 5.0,
                                    sigmaY: 5.0,
                                  ),
                                  child: Image.asset(
                                    AppImages.runningShoes2,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: SVGIconButtonWidget.circle(
                          configuration: SVGButtonConfiguration(
                            iconAsset: AppSvgs.starFill,
                            iconColor: Colors.white,
                            bgColor: Colors.white.withOpacity(0.3),
                            size: sx(30),
                            callback: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              onPageChanged: (int index) {
                _currentPageNotifier.value = index;
              }),
        );
      },
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomPageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
          selectedSize: const Size(24, 6),
          size: const Size(6, 6),
          dotSpacing: 3,
          selectedDotColor: Colors.black54,
          dotColor: Colors.grey,
        ),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad
      };
}
