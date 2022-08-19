import 'dart:ui';

import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/themes/app_colors.dart';
import 'package:app/application/ui/widgets/carousel_widget.dart';
import 'package:app/application/ui/widgets/header_widget/main_header_widget.dart';
import 'package:app/application/ui/widgets/product_cards_widget/product_card_list.dart';
import 'package:app/application/ui/widgets/tiles_widget/tile_list_widget.dart';
import 'package:flutter/material.dart';

import 'package:relative_scale/relative_scale.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return SafeArea(
        top: true,
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: HeaderDelegate(
                  child: PreferredSize(
                      preferredSize: Size.fromHeight(sx(180)),
                      child: const HeaderWidget()),
                ),
              ),
              const SliverToBoxAdapter(
                child: CarouselWidget(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSettings.padding,
                    vertical: AppSettings.padding,
                  ),
                  child: const TileListWidget(),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.all(
                  AppSettings.padding,
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      // childAspectRatio: 0.8,
                      mainAxisExtent: sx(320)),
                  delegate:ProductCardListSliverDelegate(),


                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
