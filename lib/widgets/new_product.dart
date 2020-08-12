import 'package:ecomm_admin/helpers/uihelper.dart';
import 'package:ecomm_admin/misc/ui_constants.dart';
import 'package:ecomm_admin/models/products.dart';
import 'package:flutter/material.dart';

class NewProduct extends StatelessWidget {
  final Product item;
  final Function(Product) didTap;
  NewProduct(this.item, this.didTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          child: Row(
            children: [
              Icon(Icons.add),
              UIHelper.spacer(horizontal: UIConstants.STANDARD_SPACE),
              Text(item.name)
            ],
          ),
          padding: EdgeInsets.only(
              left: UIConstants.STANDARD_MARGIN,
              top: UIConstants.STANDARD_MARGIN,
              bottom: UIConstants.STANDARD_MARGIN),
        ),
      ),
      onTap: () {
        this.didTap(item);
      },
    );
  }
}
