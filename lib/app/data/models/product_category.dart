class ProductCategory {
  final String? slug;
  final String? name;
  final String? url;

  ProductCategory({
    this.slug,
    this.name,
    this.url,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      slug: json['slug'],
      name: json['name'],
      url: json['url'],
    );
  }
}
