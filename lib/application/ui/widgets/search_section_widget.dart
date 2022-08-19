import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/themes/app_colors.dart';
import 'package:app/application/ui/widgets/search_textfield_widget.dart';
import 'package:app/application/ui/widgets/svg_icon_button_widget.dart';
import 'package:app/resources/resources.dart';

class SearchSectionWidget extends StatelessWidget {
  const SearchSectionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: sx(AppSettings.padding)),
              child: const SearchTextFieldWidget(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: sx(AppSettings.padding)),
            child: SVGIconButtonWidget(
              configuration: SVGButtonConfiguration(
                iconAsset: AppSvgs.listSettings,
                bgColor: AppColors.primary,
                iconColor: Colors.white,
                radius: sx(AppSettings.borderRadius),
                size: sx(50),
                callback: () {},
              ),
            ),
          ),
        ],
      );
    });
  }
}
