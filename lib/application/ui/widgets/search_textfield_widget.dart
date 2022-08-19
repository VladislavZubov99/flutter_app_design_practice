import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/themes/app_colors.dart';
import 'package:app/application/ui/widgets/svg_icon_button_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        height: sx(50),
        child: TextField(
          controller: searchController,
          maxLines: 1,
          style: TextStyle(
            fontSize: sx(18)
          ),
          decoration: InputDecoration(
            filled: true,
            hintText: 'Search...',
            fillColor: Colors.white,
            contentPadding: EdgeInsets.only(left: sx(20), top: sx(15)),
            isCollapsed: true,
            suffixIcon:
            Padding(
              padding: EdgeInsets.all(sx(5)),
              child: SVGIconButtonWidget.circle(
                configuration: SVGButtonConfiguration(
                  size: sx(40),
                  iconAsset: AppSvgs.search,
                  iconColor: Colors.grey,
                  callback: () {
                    searchController.clear();
                  },
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(sx(AppSettings.borderRadius)),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors.primary),
              borderRadius: BorderRadius.circular(15),

            ),
            hoverColor: Colors.white,
          ),
        ),
      );
    });

  }

}
