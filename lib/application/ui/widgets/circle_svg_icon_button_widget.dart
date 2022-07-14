import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGButtonConfiguration {
  final String iconAsset;
  final double size;
  final Color iconColor;
  final Color bgColor;

  final void Function() callback;

  SVGButtonConfiguration({
    required this.iconAsset,
    required this.size,
    required this.callback,
    this.iconColor = Colors.red,
    this.bgColor = Colors.white,
  });
}

class CircleSVGIconButtonWidget extends StatelessWidget {
  final SVGButtonConfiguration configuration;

  const CircleSVGIconButtonWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = configuration.size / 2;

    return Container(
      height: configuration.size,
      width: configuration.size,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius)),
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
                borderRadius: BorderRadius.circular(borderRadius),
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
