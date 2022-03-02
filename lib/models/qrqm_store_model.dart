// To parse this JSON data, do
//
//     final qrqmStoreModel = qrqmStoreModelFromJson(jsonString);

import 'dart:convert';

QrqmStoreModel qrqmStoreModelFromJson(String str) => QrqmStoreModel.fromJson(json.decode(str));

String qrqmStoreModelToJson(QrqmStoreModel data) => json.encode(data.toJson());

class QrqmStoreModel {
    QrqmStoreModel({
        required this.status,
        required this.success,
        required this.msg,
        required this.time,
        required this.data,
    });

    int status;
    bool success;
    String msg;
    DateTime time;
    Data data;

    factory QrqmStoreModel.fromJson(Map<String, dynamic> json) => QrqmStoreModel(
        status: json["status"],
        success: json["success"],
        msg: json["msg"],
        time: DateTime.parse(json["time"]),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "msg": msg,
        "time": time.toIso8601String(),
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.adStores,
    });

    List<AdStore> adStores;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        adStores: List<AdStore>.from(json["adStores"].map((x) => AdStore.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "adStores": List<dynamic>.from(adStores.map((x) => x.toJson())),
    };
}

class AdStore {
    AdStore({
        required this.id,
        required this.name,
        required this.type,
        required this.star,
        required this.image,
        required this.address,
        required this.latitude,
        required this.longitude,
        required this.foodType,
        required this.productVos,
    });

    int id;
    String name;
    int type;
    double star;
    String image;
    String address;
    String latitude;
    String longitude;
    String foodType;
    List<ProductVo> productVos;

    factory AdStore.fromJson(Map<String, dynamic> json) => AdStore(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        star: json["star"],
        image: json["image"],
        address: json["address"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        foodType: json["foodType"],
        productVos: List<ProductVo>.from(json["productVos"].map((x) => ProductVo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "star": star,
        "image": image,
        "address": address,
        "latitude": latitude,
        "longitude": longitude,
        "foodType": foodType,
        "productVos": List<dynamic>.from(productVos.map((x) => x.toJson())),
    };
}

class ProductVo {
    ProductVo({
        required this.id,
        required this.image,
        required this.isExclusive,
        required this.name,
        required this.price,
        required this.type,
    });

    int id;
    String image;
    int isExclusive;
    String name;
    double price;
    int type;

    factory ProductVo.fromJson(Map<String, dynamic> json) => ProductVo(
        id: json["id"],
        image: json["image"],
        isExclusive: json["isExclusive"],
        name: json["name"],
        price: json["price"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "isExclusive": isExclusive,
        "name": name,
        "price": price,
        "type": type,
    };
}
