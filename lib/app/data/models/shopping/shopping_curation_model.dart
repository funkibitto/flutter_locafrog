// To parse this JSON data, do
//
//     final shoppingCurationModel = shoppingCurationModelFromMap(jsonString);

import 'dart:convert';

enum Template { TAB_LIST, IMAGE }

final templateValues =
    EnumValues({"image": Template.IMAGE, "tabList": Template.TAB_LIST});

enum SectionType { BANNER, CURATION }

final sectionTypeValues = EnumValues(
    {"banner": SectionType.BANNER, "curation": SectionType.CURATION});

List<ShoppingCurationModel> shoppingCurationModelFromJson(String str) => List<ShoppingCurationModel>.from(json.decode(str).map((x) => ShoppingCurationModel.fromJson(x)));

class ShoppingCurationModel {
  ShoppingCurationModel({
    required this.type,
    required this.template,
    required this.data,
  });

  final String type;
  final String template;
  final Data data;

  factory ShoppingCurationModel.fromJson(Map<String, dynamic> json) =>
      ShoppingCurationModel(
        type: json["type"],
        template: json["template"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "template": template,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.webviewType,
    this.bannerId,
    this.gaTitle,
    this.destination,
    this.attach,
    this.sectionType,
    this.sortHint,
    this.curationLogicId,
    this.title,
    this.subTitle,
    this.template,
    this.gnb,
    this.grid,
    this.items,
    this.bannerAttach,
    this.fontColor,
    this.themeColor,
    this.slideBarType,
    this.isMoreView,
    this.pageUnit,
  });

  final String? webviewType;
  final String? bannerId;
  final String? gaTitle;
  final String? destination;
  final Attach? attach;
  final Template? sectionType;
  final int? sortHint;
  final String? curationLogicId;
  final String? title;
  final String? subTitle;
  final Template? template;
  final Gnb? gnb;
  final int? grid;
  final List<Item>? items;
  final dynamic bannerAttach;
  final dynamic fontColor;
  final dynamic themeColor;
  final dynamic slideBarType;
  final dynamic isMoreView;
  final dynamic pageUnit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        webviewType: json["webviewType"],
        bannerId: json["bannerId"],
        attach: json["attach"] ?? Attach.fromJson(json["attach"]),
        sectionType:
            json["sectionType"] ?? templateValues.map[json["sectionType"]],
        sortHint: json["sortHint"],
        curationLogicId: json["curationLogicId"],
        title: json["title"],
        subTitle: json["subTitle"],
        template: json["template"] ?? templateValues.map[json["template"]],
        items: json["items"] ??
            List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        bannerAttach: json["bannerAttach"],
        fontColor: json["fontColor"],
        themeColor: json["themeColor"],
        slideBarType: json["slideBarType"],
        isMoreView: json["isMoreView"],
        pageUnit: json["pageUnit"],
      );

  Map<String, dynamic> toJson() => {
        "webviewType": webviewType,
        "bannerId": bannerId,
        "attach": attach ?? attach?.toJson(),
        "sectionType": sectionType ?? templateValues.reverse[sectionType],
        "sortHint": sortHint,
        "curationLogicId": curationLogicId,
        "title": title,
        "subTitle": subTitle,
        "template": template ?? templateValues.reverse[template],
        "grid": grid ?? grid,
        "items": items ?? List<dynamic>.from(items!.map((x) => x.toJson())),
        "bannerAttach": bannerAttach,
        "fontColor": fontColor,
        "themeColor": themeColor,
        "slideBarType": slideBarType,
        "isMoreView": isMoreView,
        "pageUnit": pageUnit,
      };
}

class Attach {
  Attach({
    this.attachUri,
    this.width,
    this.attachId,
    this.height,
    this.ratio,
  });

  final String? attachUri;
  final int? width;
  final String? attachId;
  final int? height;
  final Map<String, double>? ratio;

  factory Attach.fromJson(Map<String, dynamic> json) => Attach(
        attachUri: json["attachUri"],
        width: json["width"],
        attachId: json["attachId"] ?? json["attachId"],
        height: json["height"],
        ratio: Map.from(json["ratio"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "attachUri": attachUri,
        "width": width,
        "attachId": attachId ?? attachId,
        "height": height,
        "ratio":
            Map.from(ratio!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

enum Gnb { FASHION }

final gnbValues = EnumValues({"FASHION": Gnb.FASHION});

class Item {
  Item({
    this.includeProducts,
    this.name,
    this.isMoreView,
  });

  final List<IncludeProduct>? includeProducts;
  final String? name;
  final bool? isMoreView;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        includeProducts: List<IncludeProduct>.from(
            json["includeProducts"].map((x) => IncludeProduct.fromJson(x))),
        name: json["name"],
        isMoreView: json["isMoreView"],
      );

  Map<String, dynamic> toJson() => {
        "includeProducts":
            List<dynamic>.from(includeProducts!.map((x) => x.toJson())),
        "name": name,
        "isMoreView": isMoreView,
      };
}

class IncludeProduct {
  IncludeProduct({
    required this.productId,
    this.gender,
    this.type,
    this.title,
    this.partner,
    this.shipping,
    this.brand,
    this.categoryId,
    this.isDiscount,
    this.isCoupon,
    this.imageUrlMain,
    this.price,
    this.stockQuantity,
    this.score,
    this.review,
    this.isOfficialMall,
  });

  final int productId;
  final Gender? gender;
  final int? type;
  final String? title;
  final Partner? partner;
  final Shipping? shipping;
  final Brand? brand;
  final List<String>? categoryId;
  final bool? isDiscount;
  final bool? isCoupon;
  final String? imageUrlMain;
  final Price? price;
  final StockQuantity? stockQuantity;
  final Map<String, int>? score;
  final Review? review;
  final bool? isOfficialMall;

  factory IncludeProduct.fromJson(Map<String, dynamic> json) => IncludeProduct(
        productId: json["productId"],
        gender:
            json["gender"] == null ? null : genderValues.map[json["gender"]],
        type: json["type"],
        title: json["title"],
        partner: Partner.fromJson(json["partner"]),
        shipping: Shipping.fromJson(json["shipping"]),
        brand: Brand.fromJson(json["brand"]),
        categoryId: List<String>.from(json["categoryId"].map((x) => x)),
        isDiscount: json["isDiscount"] ?? json["isDiscount"],
        isCoupon: json["isCoupon"] ?? json["isCoupon"],
        imageUrlMain: json["imageUrlMain"],
        price: Price.fromJson(json["price"]),
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        isOfficialMall: json["isOfficialMall"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "gender": gender == null ? null : genderValues.reverse[gender],
        "type": type,
        "title": title,
        "partner": partner?.toJson(),
        "shipping": shipping?.toJson(),
        "brand": brand?.toJson(),
        "categoryId": List<dynamic>.from(categoryId!.map((x) => x)),
        "isDiscount": isDiscount,
        "isCoupon": isCoupon,
        "imageUrlMain": imageUrlMain,
        "price": price?.toJson(),
        "review": review ?? review?.toJson(),
        "isOfficialMall": isOfficialMall,
      };
}

class Brand {
  Brand({
    this.id,
    this.chgDt,
    this.name,
    this.nameText,
  });

  final int? id;
  final int? chgDt;
  final String? name;
  final String? nameText;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        id: json["id"],
        chgDt: json["chg_dt"],
        name: json["name"],
        nameText: json["nameText"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chg_dt": chgDt,
        "name": name,
        "nameText": nameText,
      };
}

enum Gender { F }

final genderValues = EnumValues({"F": Gender.F});

class Partner {
  Partner({
    this.id,
  });

  final String? id;

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
      };
}

class Price {
  Price({
    this.list,
    this.discountRate,
  });

  final int? list;
  final int? discountRate;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        list: json["list"],
        discountRate: json["discountRate"],
      );

  Map<String, dynamic> toJson() => {
        "list": list,
        "discountRate": discountRate,
      };
}

class Review {
  Review({
    this.average,
    this.textCount,
    this.photoCount,
  });

  final double? average;
  final int? textCount;
  final int? photoCount;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        average: json["average"].toDouble(),
        textCount: json["textCount"],
        photoCount: json["photoCount"],
      );

  Map<String, dynamic> toJson() => {
        "average": average,
        "textCount": textCount,
        "photoCount": photoCount,
      };
}

class Shipping {
  Shipping({
    this.label,
  });

  final List<Label>? label;

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        label: json["label"] == null
            ? null
            : List<Label>.from(json["label"].map((x) => labelValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "label": label == null
            ? null
            : List<dynamic>.from(label!.map((x) => labelValues.reverse[x])),
      };
}

enum Label { EMPTY }

final labelValues = EnumValues({"무료배송": Label.EMPTY});

class StockQuantity {
  StockQuantity({
    required this.sold,
  });

  final int sold;

  factory StockQuantity.fromJson(Map<String, dynamic> json) => StockQuantity(
        sold: json["sold"],
      );

  Map<String, dynamic> toJson() => {
        "sold": sold,
      };
}

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
