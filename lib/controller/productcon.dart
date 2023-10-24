import 'dart:convert';
import 'dart:developer';

import 'package:artis/models/cartmodel.dart';
import 'package:artis/models/productmodel.dart';
import 'package:artis/repos/productrepo.dart';
// import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProductController {
  final productRepo = Product();

  Future<List<Pro>> getProduct() async {
    // final response = await productRepo.getProduct();

    final url = Uri.parse('http://10.0.2.2:8000/api/home/products/');
    final response = await http.get(url);

    List<dynamic> data = jsonDecode(response.body);
    // print("as" + data.toString());
    Map<String, List<dynamic>> datadic = {"pro": data};

    // print(datadic);

    // for (var i = 0; i < 2; i++) {
    //   print(data[i]);
    // }

    // List<Products> products = [];

    // final Jsonproducts = data[''];

    // for (dynamic productJson in Jsonproducts) {
    //   products.add(Products.fromJson(productJson));
    // }
    // print(products);
    // return products;

    Products products = Products.fromJson(datadic);
    // print(products.pro![0].productDescription.toString());

    List<Pro> productitens = products.pro!.map((e) => e).toList();
    // print("test" + products.productDescription.toString());
    // print(products.id?.isEven.toString());

    return productitens;
  }
}

class Cart {
  getCart() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/user/cart/2/');
    final response = await http.get(url);

    log(response.body);

    List<dynamic> data = jsonDecode(response.body);

    Map<String, List<dynamic>> datadics = {"cart": data};

    ProductCart carts = ProductCart.formJson(datadics);
    //List<Cart> cartitems = carts.cart!.map((e) => e).toList();

    // List<Cart> cartitems = carts.cart!.map((e) => e).toList();
    //log(cartitems.toString());
    //return cartitems;
  }
}
