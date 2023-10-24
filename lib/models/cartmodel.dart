class ProductCart {
  List<Cart>? cart;

  ProductCart({this.cart});

  ProductCart.formJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(new Cart.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cart != null) {
      data['cart'] = this.cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  int? productId;
  int? user;

  Cart({this.productId, this.user});

  Cart.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['user'] = this.user;
    return data;
  }
}
