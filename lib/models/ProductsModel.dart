class ProductsModels {
  int count;
  String next;
  Null previous;
  List<Results> results;

  ProductsModels({this.count, this.next, this.previous, this.results});

  ProductsModels.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String name;
  String slug;
  List<String> imageUrls;
  String priceType;
  String maxPrice;
  String minPrice;
  String minDiscountedPrice;

  Results(
      {this.name,
      this.slug,
      this.imageUrls,
      this.priceType,
      this.maxPrice,
      this.minPrice,
      this.minDiscountedPrice});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    imageUrls = json['image_urls'].cast<String>();
    priceType = json['price_type'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
    minDiscountedPrice = json['min_discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image_urls'] = this.imageUrls;
    data['price_type'] = this.priceType;
    data['max_price'] = this.maxPrice;
    data['min_price'] = this.minPrice;
    data['min_discounted_price'] = this.minDiscountedPrice;
    return data;
  }
}
