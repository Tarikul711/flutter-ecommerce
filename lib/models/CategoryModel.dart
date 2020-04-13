class CategoryModel {
  String name;
  String slug;
  String imageUrl;

  CategoryModel({this.name, this.slug, this.imageUrl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
