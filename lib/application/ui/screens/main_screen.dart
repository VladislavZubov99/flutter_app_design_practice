import 'package:app/application/ui/themes/app_colors.dart';
import 'package:app/application/ui/widgets/circle_avatar_icon_button_widget.dart';
import 'package:app/application/ui/widgets/circle_svg_icon_button_widget.dart';
import 'package:app/application/ui/widgets/search_textfield_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  final double _circleSize = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleSVGIconButtonWidget(
                    configuration: getMenuButtonConfiguration(),
                  ),
                  const Expanded(child: SizedBox()),
                  const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  CircleSVGIconButtonWidget(
                    configuration: getShoppingBagButtonConfiguration(),
                  ),
                  const SizedBox(width: 10),
                  CircleAvatarButtonWidget(
                    configuration: getAvatarButtonConfiguration(),
                  ),
                ],
              ),
            ),
            Row(
              children: const [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SearchTextFieldWidget(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SVGButtonConfiguration getMenuButtonConfiguration() {
    return SVGButtonConfiguration(
      iconAsset: AppSvgs.apps2Fill,
      size: _circleSize,
      callback: () {},
    );
  }

  ImageButtonConfiguration getAvatarButtonConfiguration() {
    return ImageButtonConfiguration(
      size: _circleSize,
      imageAsset: AppImages.avatar2,
      callback: () {},
    );
  }

  SVGButtonConfiguration getShoppingBagButtonConfiguration() {
    return SVGButtonConfiguration(
      size: _circleSize,
      iconAsset: AppSvgs.bagFill,
      callback: () {},
    );
  }
}
