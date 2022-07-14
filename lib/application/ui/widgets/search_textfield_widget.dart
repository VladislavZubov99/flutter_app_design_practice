import 'package:app/application/ui/widgets/circle_svg_icon_button_widget.dart';
import 'package:app/resources/resources.dart';
import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({Key? key}) : super(key: key);

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      maxLines: 1,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.only(left: 20, top: 15),
          isCollapsed: true,
          suffixIcon:
           CircleSVGIconButtonWidget(
              configuration: getShoppingBagButtonConfiguration(),
            ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          )
      ),
    );
  }
  SVGButtonConfiguration getShoppingBagButtonConfiguration() {
    return SVGButtonConfiguration(
      size: 50,
      iconAsset: AppSvgs.search,
      iconColor: Colors.grey,
      callback: () {
        searchController.clear();
      },
    );
  }
}
