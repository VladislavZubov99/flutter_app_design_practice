import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relative_scale/relative_scale.dart';

class TileWidget extends StatelessWidget {
  final bool isActive;
  final String title;
  final bool isSvg;
  final String asset;

  const TileWidget({
    Key? key,
    required this.isActive,
    required this.title,
    required this.isSvg,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final picture = isSvg
        ? SvgPicture.asset(asset,
            color: isActive ? AppColors.primary : Colors.grey)
        : Image.asset(asset);

    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: sx(20)),
        margin: EdgeInsets.only(right: sx(20)),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(sx(AppSettings.borderRadius)),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              SizedBox(
                height: sx(20),
                width: sx(20),
                child: picture,
              ),
              SizedBox(width: sx(10)),
              Text(
                title,
                style: TextStyle(
                  fontSize: sx(16),
                    color: isActive ? AppColors.primary : Colors.grey),
              )
            ],
          ),
        ),
      );
    });
  }
}
