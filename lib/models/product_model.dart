class Product {
  int id;
  String name;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  String stockStatus;
  List<Images> images;
  List<Categories> categories;
  List<Attributes> attributes;
  List<int> relatedIds;

  Product({
    this.categories,
    this.id,
    this.name,
    this.price,
    this.description,
    this.images,
    this.regularPrice,
    this.salePrice,
    this.shortDescription,
    this.sku,
    this.stockStatus,
    this.attributes,
    this.relatedIds,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice =
        json['sale_price'] != "" ? json['sale_price'] : json['regular_price'];

    stockStatus = json['stock_status'];
    relatedIds = json['cross_sell_ids'].cast<int>();
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }

    if (json['images'] != null) {
      images = new List<Images>();
      json['images'].forEach((v) {
        images.add(new Images.fromJson(v));
      });
    }
    if (json["attributes"] != null) {
      attributes = new List<Attributes>();
      json["attributes"].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
  }

  calculateDiscount() {
    double regularPrice = double.parse(this.regularPrice);
    double salePrice =
        this.salePrice != "" ? double.parse(this.salePrice) : regularPrice;
    double discount = regularPrice - salePrice;
    double disPercent = (discount / regularPrice) * 100;
    return disPercent.round();
  }
}

class Categories {
  int id;
  String name;

  Categories({
    this.name,
    this.id,
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Images {
  String src;

  Images({
    this.src,
  });

  Images.fromJson(Map<String, dynamic> json) {
    src = json['src'];
  }
}

class Attributes {
  int id;
  String name;
  List<String> options;

  Attributes({this.name, this.id, this.options});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    options = json["options"].cast<String>();
  }
}
