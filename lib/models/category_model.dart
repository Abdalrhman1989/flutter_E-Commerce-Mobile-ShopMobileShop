class Category {
  int categoryId;
  String categoryName;
  String categoryDesc;
  int parent;
  ServerImage image;

  Category({
    this.categoryName,
    this.image,
    this.categoryDesc,
    this.categoryId,
    this.parent,
  });

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['id'];
    categoryDesc = json['description'];
    categoryName = json['name'];
    parent = json['parent'];
    image = json['image'] != null
        ? new ServerImage.fromJson(json['image'])
        : image = ServerImage.fromJson(json);
  }
}

class ServerImage {
  String url;

  ServerImage({
    this.url,
  });

  ServerImage.fromJson(Map<String, dynamic> json) {
    url = json['src'];
  }
}
