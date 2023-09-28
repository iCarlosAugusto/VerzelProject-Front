class OfferModel {
  String id;
  String name;
  String brand;
  String imageUrl;

  OfferModel(this.id, this.name, this.brand, this.imageUrl);

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      json['id'] as String,
      json['name'] as String,
      json['brand'] as String,
      json['imageUrl'] as String,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'imageUrl': imageUrl,
    };
  }
}