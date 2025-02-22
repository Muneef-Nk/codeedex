class DataModel {
  int? id;
  int? partsCat;
  String? partImage;
  int? vBrand;
  int? vCategory;
  String? price;
  String? partsName;
  String? description;
  dynamic offerPrice;
  bool? isOffer;
  String? productRating;

  DataModel({
    this.id,
    this.partsCat,
    this.partImage,
    this.vBrand,
    this.vCategory,
    this.price,
    this.partsName,
    this.description,
    this.offerPrice,
    this.isOffer,
    this.productRating,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        partsCat: json["parts_Cat"],
        partImage: json["part_image"],
        vBrand: json["v_brand"],
        vCategory: json["v_category"],
        price: json["price"],
        partsName: json["parts_name"],
        description: json["description"],
        offerPrice: json["offer_price"],
        isOffer: json["is_offer"],
        productRating: json["product_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parts_Cat": partsCat,
        "part_image": partImage,
        "v_brand": vBrand,
        "v_category": vCategory,
        "price": price,
        "parts_name": partsName,
        "description": description,
        "offer_price": offerPrice,
        "is_offer": isOffer,
        "product_rating": productRating,
      };
}
