import 'dart:convert';

// GoodsCategoryModel goodsCategoryModelFromJson(String str) => GoodsCategoryModel.fromJson(json.decode(str));

// String goodsCategoryModelToJson(GoodsCategoryModel data) => json.encode(data.toJson());

class GoodsCategoryModel {
    GoodsCategoryModel({
        required this.status,
        required this.success,
        required this.msg,
        required this.data,
    });

    int status;
    bool success;
    String msg;
    List<Datum> data;

    factory GoodsCategoryModel.fromJson(Map<String, dynamic> json) => GoodsCategoryModel(
        status: json["status"],
        success: json["success"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.pid,
        required this.cateName,
        required this.pic,
        required this.isCheck,
        required this.activityStatus,
        required this.activityName,
        required this.children,
    });

    int id;
    int pid;
    String cateName;
    String pic;
    bool isCheck;
    int activityStatus;
    dynamic activityName;
    List<Datum> children;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        pid: json["pid"],
        cateName: json["cateName"],
        pic: json["pic"],
        isCheck: json["isCheck"],
        activityStatus: json["activityStatus"],
        activityName: json["activityName"],
        children: List<Datum>.from(json["children"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pid": pid,
        "cateName": cateName,
        "pic": pic,
        "isCheck": isCheck,
        "activityStatus": activityStatus,
        "activityName": activityName,
        "children": List<dynamic>.from(children.map((x) => x.toJson())),
    };
}
