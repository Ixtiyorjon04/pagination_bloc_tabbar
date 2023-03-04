class TexnomartModel {
  TexnomartModel({required this.items, required this.meta});

  final List<TexnomartItem> items;
  final Meta meta;

  factory TexnomartModel.fromJson(Map<String, dynamic> json) => TexnomartModel(
        items: List<TexnomartItem>.from(
            (json["items"] ?? []).map((x) => TexnomartItem.fromJson(x))),
        meta: Meta.fromJson(json["_meta"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "_meta": meta.toJson(),
      };
}

class TexnomartItem {
  TexnomartItem({
    required this.id,
    required this.name,
    required this.image,
    // required this.stik,
    // required this.allStock,
    // required this.availability,
    // required this.reviewsCount,
    // required this.reviewsMiddleRate,
    // required this.salePrice,
    // required this.fSalePrice,
    // required this.loanPrice,
    // required this.fLoanPrice,
    // required this.oldPrice,
    // required this.fOldPrice,
    // required this.axiomMonthlyPrice,
    // required this.kodProduct,
    // required this.discount,
  });

  final int id;
  final String name;

 final String image;
  // final Stik stik;
  // final int allStock;
  // final Availability availability;
  // final int reviewsCount;
  // final int reviewsMiddleRate;
  // final int salePrice;
  // final String fSalePrice;
  // final int loanPrice;
  // final String fLoanPrice;
  // final String oldPrice;
  // final String fOldPrice;
  // final String axiomMonthlyPrice;
  // final String kodProduct;
  // final String discount;

  factory TexnomartItem.fromJson(Map<String, dynamic> json) => TexnomartItem(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
         image: json["image"] ?? "",
        // stik: Stik.fromJson(json["stik"] ?? {}),
        // allStock: json["allStock"] ?? 0,
        // availability: Availability.fromJson(json["availability"] ?? {}),
        // reviewsCount: json["reviewsCount"] ?? 0,
        // reviewsMiddleRate: json["reviewsMiddleRate"] ?? 0,
        // salePrice: json["sale_price"] ?? 0,
        // fSalePrice: json["f_sale_price"] ?? "",
        // loanPrice: json["loan_price"] ?? 0,
        // fLoanPrice: json["f_loan_price"] ?? "",
        // oldPrice: json["old_price"] ?? "",
        // fOldPrice: json["f_old_price"] ?? "",
        // axiomMonthlyPrice: json["axiomMonthlyPrice"] ?? "",
        // kodProduct: json["kod_product"] ?? "",
        // discount: json["discount"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
       "image": image,
        // "stik": stik.toJson(),
        // "allStock": allStock,
        // "availability": availability.toJson(),
        // "reviewsCount": reviewsCount,
        // "reviewsMiddleRate": reviewsMiddleRate,
        // "sale_price": salePrice,
        // "f_sale_price": fSalePrice,
        // "loan_price": loanPrice,
        // "f_loan_price": fLoanPrice,
        // "old_price": oldPrice,
        // "f_old_price": fOldPrice,
        // "axiomMonthlyPrice": axiomMonthlyPrice,
        // "kod_product": kodProduct,
        // "discount": discount,
      };
}

class Availability {
  Availability({required this.type, required this.text});

  final String type;
  final String text;

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        type: json["type"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
      };
}

class Stik {
  Stik({
    required this.id,
    required this.title,
    required this.backround,
    required this.color,
    required this.key,
    required this.icon,
  });

  final int id;
  final String title;
  final String backround;
  final String color;
  final String key;
  final String icon;

  factory Stik.fromJson(Map<String, dynamic> json) => Stik(
        id: json["id"],
        title: json["title"],
        backround: json["backround"],
        color: json["color"],
        key: json["key"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "backround": backround,
        "color": color,
        "key": key,
        "icon": icon,
      };
}

class Meta {
  Meta({
    required this.totalCount,
    required this.pageCount,
    required this.currentPage,
    required this.perPage,
  });

  final int totalCount;
  final int pageCount;
  final int currentPage;
  final int perPage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalCount: json["totalCount"] ?? 0,
        pageCount: json["pageCount"] ?? 0,
        currentPage: json["currentPage"] ?? 0,
        perPage: json["perPage"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "totalCount": totalCount,
        "pageCount": pageCount,
        "currentPage": currentPage,
        "perPage": perPage,
      };
}
