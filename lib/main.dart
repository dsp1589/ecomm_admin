import 'package:dio/dio.dart';
import 'package:ecomm_admin/helpers/uihelper.dart';
import 'package:ecomm_admin/misc/string_constants.dart';
import 'package:ecomm_admin/models/products.dart';
import 'package:ecomm_admin/widgets/new_product.dart';
import 'package:ecomm_admin/widgets/product_details_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dio = Dio(); // Provide a dio instance
  final client = Service(dio);

  runApp(MultiProvider(
    providers: [
      Provider(create: (_) => client),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECOMM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: StringConstants.APP_TITLE),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: Provider.of<Service>(context, listen: false).getProducts(),
        builder:
            (BuildContext buildContext, AsyncSnapshot<List<Product>> products) {
          if (products.connectionState == ConnectionState.done && products.hasData) {
            if (products.data.isEmpty) {
              return Center(
                child: Text(StringConstants.ITEM_CANNOT_BE_ADDED),
              );
            } else {
              return ListView.builder(
                itemBuilder: (BuildContext context, int at) {
                  return NewProduct(products.data[at], _itemSelectedForAdd);
                },
                itemCount: products.data.length,
              );
            }
          } else {
            return UIHelper.getLoading();
          }
        },
      ),
    );
  }

  //Push a new form to get product details
  void _itemSelectedForAdd(Product p){
    Navigator.push(this.context, MaterialPageRoute(builder: (_context){
      return Material(child: ProductDetailsForm(p.name));
    }));
  }
}
