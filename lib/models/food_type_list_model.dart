
class FoodTypeListModel {
    FoodTypeListModel({
        required this.status,
        required this.success,
        required this.msg,
        required this.data,
        required this.time,
    });

    int status;
    bool success;
    String msg;
    Data data;
    DateTime time;

    factory FoodTypeListModel.fromJson(Map<String, dynamic> json) => FoodTypeListModel(
        status: json["status"],
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "success": success,
        "msg": msg,
        "data": data.toJson(),
        "time": time.toIso8601String(),
    };
}

class Data {
    Data({
        required this.content,
        required this.totalElements,
    });

    List<Content> content;
    int totalElements;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        totalElements: json["totalElements"],
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "totalElements": totalElements,
    };
}

class Content {
    Content({
        required this.createTime,
        required this.dictId,
        required this.id,
        required this.label,
        required this.sort,
        required this.value,
    });

    int createTime;
    int dictId;
    int id;
    String label;
    int sort;
    String value;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        createTime: json["createTime"],
        dictId: json["dictId"],
        id: json["id"],
        label: json["label"],
        sort: json["sort"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "createTime": createTime,
        "dictId": dictId,
        "id": id,
        "label": label,
        "sort": sort,
        "value": value,
    };
}
