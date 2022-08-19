import 'dart:math';

import 'package:app/application/ui/my_app/app_settings.dart';
import 'package:app/application/ui/widgets/svg_icon_button_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

class ProductCardListSliverDelegate extends SliverChildBuilderDelegate {
  ProductCardListSliverDelegate()
      : super((context, index) {
          final product = Products.productItems[index];
          return RelativeBuilder(builder: (context, height, width, sy, sx) {
            return Container(
              // generate blues with random shades
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(sx(AppSettings.borderRadius)),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSettings.padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: sx(35),
                          height: sx(18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  sx(AppSettings.borderRadius)),
                              color: Colors.blueGrey[100]),
                          child: Center(
                            child: Text(
                              '20%',
                              style: TextStyle(fontSize: sx(10)),
                            ),
                          ),
                        ),
                        SVGIconButtonWidget.circle(
                          configuration: SVGButtonConfiguration(
                            iconAsset: AppSvgs.starFill,
                            size: sx(40),
                            callback: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                        height: sx(140),
                        width: sx(140),
                        child: Image.asset(product.assetName)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: TextStyle(
                                fontSize: sx(16),
                              ),
                            ),
                            SizedBox(
                              height: sx(5),
                            ),
                            Text(
                              product.price,
                              style: TextStyle(
                                  fontSize: sx(24),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        }, childCount: Products.productItems.length);
}

class ProductItem {
  final Color? color = Colors.blueGrey[(Random().nextInt(3) + 1) * 100];
  final String assetName;
  final String title;
  final String price;

  ProductItem({
    required this.assetName,
    required this.title,
    required this.price,
  });
}

class Products {
  static final List<ProductItem> productItems = List.generate(10, (i) {
    return ProductItem(
        assetName:
            i % 2 == 0 ? AppImages.runningShoes2 : AppImages.runningShoes1,
        title: 'Shoes',
        price:
            '\$ ${(Random().nextInt(30) + 10)}.${(Random().nextInt(19) + 80)}');
  });
}
