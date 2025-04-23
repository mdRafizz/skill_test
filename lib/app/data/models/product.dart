class Product {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  double? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Review>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<String>? images;
  String? thumbnail;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.images,
    this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    category: json['category'],
    price: (json['price'] as num?)?.toDouble(),
    discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
    rating: (json['rating'] as num?)?.toDouble(),
    stock: json['stock'],
    tags: (json['tags'] as List<dynamic>?)?.cast<String>(),
    brand: json['brand'],
    sku: json['sku'],
    weight: (json['weight'] as num?)?.toDouble(),
    dimensions: json['dimensions'] != null
        ? Dimensions.fromJson(json['dimensions'])
        : null,
    warrantyInformation: json['warrantyInformation'],
    shippingInformation: json['shippingInformation'],
    availabilityStatus: json['availabilityStatus'],
    reviews: (json['reviews'] as List<dynamic>?)
        ?.map((e) => Review.fromJson(e))
        .toList(),
    returnPolicy: json['returnPolicy'],
    minimumOrderQuantity: json['minimumOrderQuantity'],
    meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
    images: (json['images'] as List<dynamic>?)?.cast<String>(),
    thumbnail: json['thumbnail'],
  );
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: (json['width'] as num?)?.toDouble(),
    height: (json['height'] as num?)?.toDouble(),
    depth: (json['depth'] as num?)?.toDouble(),
  );
}

class Review {
  double? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: (json['rating'] as num?)?.toDouble(),
    comment: json['comment'],
    date: json['date'],
    reviewerName: json['reviewerName'],
    reviewerEmail: json['reviewerEmail'],
  );
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    barcode: json['barcode'],
    qrCode: json['qrCode'],
  );
}
