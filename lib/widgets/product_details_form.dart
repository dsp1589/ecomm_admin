import 'package:ecomm_admin/models/form_field.dart';
import 'package:ecomm_admin/services/service.dart';
import 'package:ecomm_admin/widgets/form/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsForm extends StatefulWidget {
  final String productName;

  ProductDetailsForm(this.productName);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsFormState();
  }
}

class _ProductDetailsFormState extends State<ProductDetailsForm> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (_context, AsyncSnapshot<List<FormItem>> fields) {
        if (fields.hasData) {
          return Scaffold(
            body: fields.data.isEmpty
                ? _getNoField()
                : Container(
                    child: FormWidget(fields.data),
                  ),
            appBar: _getAppBar,
          );
        }
        if (fields.connectionState == ConnectionState.done) {
          return Scaffold(
              body: _getNoField(), appBar: _getAppBar,);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      future:
          Provider.of<Service>(context).getFormForProduct(widget.productName),
    );
  }

  Widget get _getAppBar =>
    AppBar(
      title: Text("${widget.productName} Details"),
    );


  Widget _getNoField() {
    return Center(
      child: Text("No Fields retrieved"),
    );
  }
}
