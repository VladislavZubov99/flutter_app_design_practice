import 'package:app/application/ui/widgets/tiles_widget/tile_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class TileListWidget extends StatefulWidget {
  const TileListWidget({Key? key}) : super(key: key);

  @override
  State<TileListWidget> createState() => _TileListWidgetState();
}

class _TileListWidgetState extends State<TileListWidget> {
  int activeTileIndex = 0;

  final tiles = [
    {
      'asset': AppSvgs.gridFill,
      'isSvg': true,
      'title': 'All',
    },
    {
      'asset': AppImages.runningShoes1,
      'isSvg': false,
      'title': 'Footwear',
    },
    {
      'asset': AppImages.runningShoes2,
      'isSvg': false,
      'title': 'Watch',
    },
  ];

  List<Widget> buildTileList() {
    return tiles
        .asMap()
        .map((index, e) {
          return MapEntry(
              index,
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeTileIndex = index;
                  });
                },
                child: TileWidget(
                  isActive: activeTileIndex == index,
                  title: e['title'] as String,
                  isSvg: e['isSvg'] as bool,
                  asset: e['asset'] as String,
                ),
              ));
        })
        .values
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SizedBox(
        height: sx(60),
        child: ListView(
            scrollDirection: Axis.horizontal, children: buildTileList()),
      );
    });
  }
}
