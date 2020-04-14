class ProductDetails {
  bool success;
  String message;
  Data data;

  ProductDetails({this.success, this.message, this.data});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Attributes> attributes;
  List<ProductVariants> productVariants;
  List<ProductSpecifications> productSpecifications;

  Data({this.attributes, this.productVariants, this.productSpecifications});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      attributes = new List<Attributes>();
      json['attributes'].forEach((v) {
        attributes.add(new Attributes.fromJson(v));
      });
    }
    if (json['product_variants'] != null) {
      productVariants = new List<ProductVariants>();
      json['product_variants'].forEach((v) {
        productVariants.add(new ProductVariants.fromJson(v));
      });
    }
    if (json['product_specifications'] != null) {
      productSpecifications = new List<ProductSpecifications>();
      json['product_specifications'].forEach((v) {
        productSpecifications.add(new ProductSpecifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes.map((v) => v.toJson()).toList();
    }
    if (this.productVariants != null) {
      data['product_variants'] =
          this.productVariants.map((v) => v.toJson()).toList();
    }
    if (this.productSpecifications != null) {
      data['product_specifications'] =
          this.productSpecifications.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attributes {
  String attributeSlug;
  String attributeName;
  List<AttributeValues> attributeValues;

  Attributes({this.attributeSlug, this.attributeName, this.attributeValues});

  Attributes.fromJson(Map<String, dynamic> json) {
    attributeSlug = json['attribute_slug'];
    attributeName = json['attribute_name'];
    if (json['attribute_values'] != null) {
      attributeValues = new List<AttributeValues>();
      json['attribute_values'].forEach((v) {
        attributeValues.add(new AttributeValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_slug'] = this.attributeSlug;
    data['attribute_name'] = this.attributeName;
    if (this.attributeValues != null) {
      data['attribute_values'] =
          this.attributeValues.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AttributeValues {
  String value;
  int key;

  AttributeValues({this.value, this.key});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['key'] = this.key;
    return data;
  }
}

class ProductVariants {
  String sku;
  int variantId;
  String productName;
  int approved;
  dynamic minPrice;
  dynamic maxPrice;
  String productDescription;
  String brandName;
  String brandSlug;
  String categorySlug;
  int categoryId;
  String categoryName;
  List<int> attributeValues;
  List<String> productImages;
  String colorImage;

  ProductVariants(
      {this.sku,
      this.variantId,
      this.productName,
      this.approved,
      this.minPrice,
      this.maxPrice,
      this.productDescription,
      this.brandName,
      this.brandSlug,
      this.categorySlug,
      this.categoryId,
      this.categoryName,
      this.attributeValues,
      this.productImages,
      this.colorImage});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    variantId = json['variant_id'];
    productName = json['product_name'];
    approved = json['approved'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    productDescription = json['product_description'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    categorySlug = json['category_slug'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    attributeValues = json['attribute_values'].cast<int>();
    productImages = json['product_images'].cast<String>();
    colorImage = json['color_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sku'] = this.sku;
    data['variant_id'] = this.variantId;
    data['product_name'] = this.productName;
    data['approved'] = this.approved;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    data['product_description'] = this.productDescription;
    data['brand_name'] = this.brandName;
    data['brand_slug'] = this.brandSlug;
    data['category_slug'] = this.categorySlug;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['attribute_values'] = this.attributeValues;
    data['product_images'] = this.productImages;
    data['color_image'] = this.colorImage;
    return data;
  }
}

class ProductSpecifications {
  int id;
  String specificationName;
  String specificationValue;

  ProductSpecifications(
      {this.id, this.specificationName, this.specificationValue});

  ProductSpecifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specificationName = json['specification_name'];
    specificationValue = json['specification_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specification_name'] = this.specificationName;
    data['specification_value'] = this.specificationValue;
    return data;
  }
}
