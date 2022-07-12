import 'package:flutter/material.dart';

class ImageButtonConfiguration {
  final String imageAsset;
  final double size;
  final void Function() callback;

  ImageButtonConfiguration({
    required this.imageAsset,
    required this.size,
    required this.callback,
  });
}

class CircleAvatarButtonWidget extends StatelessWidget {
  final ImageButtonConfiguration configuration;

  const CircleAvatarButtonWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: configuration.size,
      width: configuration.size,
      child: Material(
        elevation: 4.0,
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: Ink.image(
          image: AssetImage(configuration.imageAsset),
          fit: BoxFit.cover,
          child: InkWell(
            onTap: configuration.callback,
          ),
        ),
      ),
    );
  }
}
