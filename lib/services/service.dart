import "dart:async";

import 'package:dio/dio.dart';
import 'package:ecomm_admin/models/form_field.dart';
import 'package:ecomm_admin/models/products.dart';
import 'package:retrofit/retrofit.dart';

part 'service.g.dart';

@RestApi(baseUrl: "https://ds-ecom.azurewebsites.net/")
abstract class Service {
  factory Service(Dio dio, {String baseUrl}) = _Service;
  @GET("products")
  Future<List<Product>> getProducts();
  @GET("products/{productType}")
  Future<List<FormItem>> getFormForProduct(@Path("productType") String product);
}

