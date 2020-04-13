class ShopModel {
  bool success;
  String message;
  int count;
  List<Data> data;

  ShopModel({this.success, this.message, this.count, this.data});

  ShopModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String slug;
  String contactNumber;
  String shopName;
  String shopImage;
  int approval;
  String ownerName;

  Data(
      {this.slug,
        this.contactNumber,
        this.shopName,
        this.shopImage,
        this.approval,
        this.ownerName});

  Data.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    contactNumber = json['contact_number'];
    shopName = json['shop_name'];
    shopImage = json['shop_image'];
    approval = json['approval'];
    ownerName = json['owner_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['contact_number'] = this.contactNumber;
    data['shop_name'] = this.shopName;
    data['shop_image'] = this.shopImage;
    data['approval'] = this.approval;
    data['owner_name'] = this.ownerName;
    return data;
  }
}
