class BannerListModel {
    BannerListModel({
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

    factory BannerListModel.fromJson(Map<String, dynamic> json) => BannerListModel(
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
        required this.banner,
    });

    List<Banner> banner;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "banner": List<dynamic>.from(banner.map((x) => x.toJson())),
    };
}

class Banner {
    Banner({
        required this.createTime,
        required this.groupName,
        required this.id,
        required this.sort,
        required this.status,
        required this.type,
        required this.updateTime,
        required this.value,
    });

    dynamic createTime;
    String groupName;
    int id;
    int sort;
    int status;
    int type;
    dynamic updateTime;
    String value;

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        createTime: json["createTime"],
        groupName: json["groupName"],
        id: json["id"],
        sort: json["sort"],
        status: json["status"],
        type: json["type"],
        updateTime: json["updateTime"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "createTime": createTime.toIso8601String(),
        "groupName": groupName,
        "id": id,
        "sort": sort,
        "status": status,
        "type": type,
        "updateTime": updateTime.toIso8601String(),
        "value": value,
    };
}
