class LeBazarData {
  LeBazarData({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.company,
    required this.category,
    required this.manufacturer,
    required this.measurement,
    required this.createdDate,
    required this.images,
    required this.parentId,
    required this.missing,
    required this.oldPrice,
    required this.addedWishlist,
    required this.categoryList,
    required this.ingredientProducts,
    required this.attributes,
    required this.companyGroup,
    required this.sale,
    required this.campaign,
    required this.popular,
  });

  int id;
  String name;
  String description;
  int price;
  Company company;
  Category category;
  Category manufacturer;
  Measurement measurement;
  int createdDate;
  List<Image> images;
  int parentId;
  bool missing;
  int oldPrice;
  bool addedWishlist;
  List<dynamic> categoryList;
  List<dynamic> ingredientProducts;
  List<dynamic> attributes;
  Company companyGroup;
  bool sale;
  bool campaign;
  bool popular;

  factory LeBazarData.fromJson(Map<String, dynamic> json) => LeBazarData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        company: Company.fromJson(json["company"]),
        category: Category.fromJson(json["category"]),
        manufacturer: Category.fromJson(json["manufacturer"]),
        measurement: Measurement.fromJson(json["measurement"]),
        createdDate: json["createdDate"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        parentId: json["parentId"],
        missing: json["missing"],
        oldPrice: json["oldPrice"],
        addedWishlist: json["addedWishlist"],
        categoryList: List<dynamic>.from(json["categoryList"].map((x) => x)),
        ingredientProducts:
            List<dynamic>.from(json["ingredientProducts"].map((x) => x)),
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        companyGroup: Company.fromJson(json["companyGroup"]),
        sale: json["sale"],
        campaign: json["campaign"],
        popular: json["popular"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "company": company.toJson(),
        "category": category.toJson(),
        "manufacturer": manufacturer.toJson(),
        "measurement": measurement.toJson(),
        "createdDate": createdDate,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "parentId": parentId,
        "missing": missing,
        "oldPrice": oldPrice,
        "addedWishlist": addedWishlist,
        "categoryList": List<dynamic>.from(categoryList.map((x) => x)),
        "ingredientProducts":
            List<dynamic>.from(ingredientProducts.map((x) => x)),
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "companyGroup": companyGroup.toJson(),
        "sale": sale,
        "campaign": campaign,
        "popular": popular,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Company {
  Company({
    required this.id,
  });

  int id;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Image {
  Image({
    required this.id,
    required this.productId,
    required this.main,
    required this.largeUrl,
    required this.mediumUrl,
    required this.smallUrl,
  });

  int id;
  int productId;
  bool main;
  String largeUrl;
  String mediumUrl;
  String smallUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        productId: json["productId"],
        main: json["main"],
        largeUrl: json["largeUrl"],
        mediumUrl: json["mediumUrl"],
        smallUrl: json["smallUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "main": main,
        "largeUrl": largeUrl,
        "mediumUrl": mediumUrl,
        "smallUrl": smallUrl,
      };
}

class Measurement {
  Measurement({
    required this.id,
    required this.name,
    required this.description,
    required this.code,
  });

  int id;
  String name;
  String description;
  String code;

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "code": code,
      };
}
