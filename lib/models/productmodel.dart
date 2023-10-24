class Products {
  List<Pro>? pro;

  Products({this.pro});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['pro'] != null) {
      pro = <Pro>[];
      json['pro'].forEach((v) {
        pro!.add(new Pro.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pro != null) {
      data['pro'] = this.pro!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pro {
  int? id;
  String? pName;
  double? price;
  String? productDescription;
  String? productColor;
  String? productSpecifications;
  String? productImage;
  String? productVideos;
  String? createdOn;
  bool? availability;
  int? ownerId;
  int? storeId;
  int? pCatagory;

  Pro(
      {this.id,
      this.pName,
      this.price,
      this.productDescription,
      this.productColor,
      this.productSpecifications,
      this.productImage,
      this.productVideos,
      this.createdOn,
      this.availability,
      this.ownerId,
      this.storeId,
      this.pCatagory});

  Pro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pName = json['p_name'];
    price = json['price'];
    productDescription = json['product_description'];
    productColor = json['product_color'];
    productSpecifications = json['product_specifications'];
    productImage = json['product_image'];
    productVideos = json['product_videos'];
    createdOn = json['created_on'];
    availability = json['availability'];
    ownerId = json['owner_id'];
    storeId = json['store_id'];
    pCatagory = json['p_catagory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['p_name'] = this.pName;
    data['price'] = this.price;
    data['product_description'] = this.productDescription;
    data['product_color'] = this.productColor;
    data['product_specifications'] = this.productSpecifications;
    data['product_image'] = this.productImage;
    data['product_videos'] = this.productVideos;
    data['created_on'] = this.createdOn;
    data['availability'] = this.availability;
    data['owner_id'] = this.ownerId;
    data['store_id'] = this.storeId;
    data['p_catagory'] = this.pCatagory;
    return data;
  }
}
