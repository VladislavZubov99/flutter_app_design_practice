import 'package:app/application/ui/themes/app_colors.dart';
import 'package:app/application/ui/widgets/circle_avatar_icon_button_widget.dart';
import 'package:app/application/ui/widgets/circle_svg_icon_button_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
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
                SizedBox(width: 10),
                CircleAvatarButtonWidget(
                  configuration: getAvatarButtonConfiguration(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  SVGButtonConfiguration getMenuButtonConfiguration() {
    return SVGButtonConfiguration(
      iconAsset: AppSvgs.appsFill,
      size: 60,
      callback: () {},
    );
  }

  ImageButtonConfiguration getAvatarButtonConfiguration() {
    return ImageButtonConfiguration(
      size: 60,
      imageAsset: AppImages.avatar2,
      callback: () {},
    );
  }

  SVGButtonConfiguration getShoppingBagButtonConfiguration() {
    return SVGButtonConfiguration(
      size: 60,
      iconAsset: AppSvgs.bagFill,
      callback: () {},
    );
  }
}
