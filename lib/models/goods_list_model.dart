class GoodsListModel {
    GoodsListModel({
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

    factory GoodsListModel.fromJson(Map<String, dynamic> json) => GoodsListModel(
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
        required this.records,
        required this.countId,
        required this.current,
        required this.hitCount,
        required this.maxLimit,
        required this.optimizeCountSql,
        required this.orders,
        required this.pages,
        required this.searchCount,
        required this.size,
        required this.total,
    });

    List<Record> records;
    dynamic countId;
    int current;
    bool hitCount;
    dynamic maxLimit;
    bool optimizeCountSql;
    List<dynamic> orders;
    int pages;
    bool searchCount;
    int size;
    int total;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        records: List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
        countId: json["countId"],
        current: json["current"],
        hitCount: json["hitCount"],
        maxLimit: json["maxLimit"],
        optimizeCountSql: json["optimizeCountSql"],
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        pages: json["pages"],
        searchCount: json["searchCount"],
        size: json["size"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "records": List<dynamic>.from(records.map((x) => x.toJson())),
        "countId": countId,
        "current": current,
        "hitCount": hitCount,
        "maxLimit": maxLimit,
        "optimizeCountSql": optimizeCountSql,
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "pages": pages,
        "searchCount": searchCount,
        "size": size,
        "total": total,
    };
}

class Record {
    Record({
        required this.id,
        required this.merId,
        required this.image,
        required this.storeName,
        required this.storeInfo,
        required this.price,
        required this.sort,
        required this.otPrice,
        required this.sales,
        required this.unitName,
        required this.thirdCompareName,
        required this.selfBuyMoney,
        required this.allCommission,
        required this.platCommission,
        required this.thirdPrice,
        required this.shareBuyMoney,
        required this.isExclusive,
        required this.type,
    });

    int id;
    int merId;
    String image;
    String storeName;
    String storeInfo;
    double price;
    int sort;
    double otPrice;
    int sales;
    String unitName;
    String thirdCompareName;
    double selfBuyMoney;
    double allCommission;
    double platCommission;
    double thirdPrice;
    double shareBuyMoney;
    int isExclusive;
    int type;

    factory Record.fromJson(Map<String, dynamic> json) => Record(
        id: json["id"],
        merId: json["merId"],
        image: json["image"],
        storeName: json["storeName"],
        storeInfo: json["storeInfo"],
        price: json["price"],
        sort: json["sort"],
        otPrice: json["otPrice"],
        sales: json["sales"],
        unitName: json["unitName"],
        thirdCompareName: json["thirdCompareName"],
        selfBuyMoney: json["selfBuyMoney"],
        allCommission: json["allCommission"],
        platCommission: json["platCommission"],
        thirdPrice: json["thirdPrice"],
        shareBuyMoney: json["shareBuyMoney"],
        isExclusive: json["isExclusive"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "merId": merId,
        "image": image,
        "storeName": storeName,
        "storeInfo": storeInfo,
        "price": price,
        "sort": sort,
        "otPrice": otPrice,
        "sales": sales,
        "unitName": unitName,
        "thirdCompareName": thirdCompareName,
        "selfBuyMoney": selfBuyMoney,
        "allCommission": allCommission,
        "platCommission": platCommission,
        "thirdPrice": thirdPrice,
        "shareBuyMoney": shareBuyMoney,
        "isExclusive": isExclusive,
        "type": type,
    };
}
