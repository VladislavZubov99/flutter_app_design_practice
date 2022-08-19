import 'package:app/application/ui/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGButtonConfiguration {
  final String iconAsset;
  final double size;
  final Color iconColor;
  final Color bgColor;
  final double radius;

  final void Function() callback;

  SVGButtonConfiguration({
    required this.iconAsset,
    required this.size,
    required this.callback,
    this.iconColor = AppColors.primary,
    this.bgColor = Colors.white,
    this.radius = 0.0,
  });
}

class SVGIconButtonWidget extends StatelessWidget {
  final SVGButtonConfiguration configuration;
  final bool isCircle;

  const SVGIconButtonWidget({
    Key? key,
    required this.configuration,
    this.isCircle = false,
  }) : super(key: key);

  const SVGIconButtonWidget.circle({
    Key? key,
    required this.configuration,
    this.isCircle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = configuration.size / 2;

    return Container(
      height: configuration.size,
      width: configuration.size,
      decoration: BoxDecoration(
        color: configuration.bgColor,
        borderRadius: BorderRadius.circular(
          isCircle ? borderRadius : configuration.radius,
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              configuration.iconAsset,
              color: configuration.iconColor,
              height: configuration.size / 2,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: configuration.callback,
                borderRadius: BorderRadius.circular(
                  isCircle ? borderRadius : configuration.radius,
                ),
                child: Container(
                  width: configuration.size,
                  height: configuration.size,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
