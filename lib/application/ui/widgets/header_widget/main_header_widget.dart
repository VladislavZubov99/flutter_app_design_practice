import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/themes/app_colors.dart';
import 'package:app/application/ui/widgets/circle_avatar_icon_button_widget.dart';
import 'package:app/application/ui/widgets/search_section_widget.dart';
import 'package:app/application/ui/widgets/svg_icon_button_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';





class HeaderWidget extends StatelessWidget {
  final double _circleSize = 50;

  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return ColoredBox(
        color: AppColors.background,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: AppSettings.padding,
                right: AppSettings.padding,
                top: AppSettings.padding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getMenuButton(),
                  const Expanded(child: SizedBox()),
                  Text(
                    'Home',
                    style: TextStyle(
                      fontSize: sx(24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  getShoppingBagButton(),
                  SizedBox(width: sx(AppSettings.padding)),
                  getAvatarButton()
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSettings.padding),
              child: const SearchSectionWidget(),
            ),
          ],
        ),
      );
    });
  }

  Widget getMenuButton() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SVGIconButtonWidget.circle(
        configuration: SVGButtonConfiguration(
          iconAsset: AppSvgs.appsFill,
          size: sx(_circleSize),
          callback: () {},
        ),
      );
    });
  }

  Widget getShoppingBagButton() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SVGIconButtonWidget.circle(
        configuration: SVGButtonConfiguration(
          size: sx(_circleSize),
          iconAsset: AppSvgs.bagFill,
          iconColor: AppColors.shoppingBag,
          callback: () {},
        ),
      );
    });
  }

  Widget getAvatarButton() {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return CircleAvatarButtonWidget(
        configuration: ImageButtonConfiguration(
          size: sx(_circleSize),
          imageAsset: AppImages.avatar2,
          callback: () {},
        ),
      );
    });
  }
}


class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  HeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}