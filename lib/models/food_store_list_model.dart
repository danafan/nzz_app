class FoodStoreListModel {
    FoodStoreListModel({
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

    factory FoodStoreListModel.fromJson(Map<String, dynamic> json) => FoodStoreListModel(
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
        required this.id,
        required this.name,
        required this.introduction,
        required this.phone,
        required this.bgImage,
        required this.idInformation,
        required this.promise,
        required this.star,
        required this.environmentStar,
        required this.tasteStar,
        required this.serviceStar,
        required this.address,
        required this.detailedAddress,
        required this.image,
        required this.latitude,
        required this.longitude,
        required this.validTime,
        required this.dayTime,
        required this.createTime,
        required this.type,
        required this.isSelf,
        required this.isShow,
        required this.isOpen,
        required this.sliderImage,
        required this.tags,
        required this.foodTypes,
        required this.avgPrice,
        required this.saleNum,
        required this.openDay,
        this.validTimeEnd,
        this.validTimeStart,
        required this.dayTimeStart,
        required this.dayTimeEnd,
        required this.adSort,
        required this.email,
        required this.companyName,
        required this.brandName,
        required this.license,
        required this.permit,
        required this.idFront,
        required this.idReverse,
        required this.distance,
        required this.storeProducts,
    });

    int id;
    String name;
    String introduction;
    String phone;
    String bgImage;
    String idInformation;
    String promise;
    String star;
    String environmentStar;
    String tasteStar;
    String serviceStar;
    String address;
    String detailedAddress;
    String image;
    String latitude;
    String longitude;
    String validTime;
    String dayTime;
    int createTime;
    int type;
    int isSelf;
    int isShow;
    int isOpen;
    dynamic sliderImage;
    String tags;
    String foodTypes;
    int avgPrice;
    int saleNum;
    String openDay;
    dynamic validTimeEnd;
    dynamic validTimeStart;
    int dayTimeStart;
    int dayTimeEnd;
    int adSort;
    String email;
    String companyName;
    String brandName;
    String license;
    String permit;
    String idFront;
    String idReverse;
    int distance;
    List<StoreProduct> storeProducts;

    factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        name: json["name"],
        introduction: json["introduction"],
        phone: json["phone"],
        bgImage: json["bgImage"],
        idInformation: json["idInformation"],
        promise: json["promise"],
        star: json["star"],
        environmentStar: json["environmentStar"],
        tasteStar: json["tasteStar"],
        serviceStar: json["serviceStar"],
        address: json["address"],
        detailedAddress: json["detailedAddress"],
        image: json["image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        validTime: json["validTime"],
        dayTime: json["dayTime"],
        createTime: json["createTime"],
        type: json["type"],
        isSelf: json["isSelf"],
        isShow: json["isShow"],
        isOpen: json["isOpen"],
        sliderImage: json["slider_image"],
        tags: json["tags"],
        foodTypes: json["foodTypes"],
        avgPrice: json["avgPrice"],
        saleNum: json["saleNum"],
        openDay: json["openDay"],
        validTimeEnd: json["validTimeEnd"],
        validTimeStart: json["validTimeStart"],
        dayTimeStart: json["dayTimeStart"],
        dayTimeEnd: json["dayTimeEnd"],
        adSort: json["adSort"],
        email: json["email"],
        companyName: json["companyName"],
        brandName: json["brandName"],
        license: json["license"],
        permit: json["permit"],
        idFront: json["idFront"],
        idReverse: json["idReverse"],
        distance: json["distance"],
        storeProducts: List<StoreProduct>.from(json["storeProducts"].map((x) => StoreProduct.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "introduction": introduction,
        "phone": phone,
        "bgImage": bgImage,
        "idInformation": idInformation,
        "promise": promise,
        "star": star,
        "environmentStar": environmentStar,
        "tasteStar": tasteStar,
        "serviceStar": serviceStar,
        "address": address,
        "detailedAddress": detailedAddress,
        "image": image,
        "latitude": latitude,
        "longitude": longitude,
        "validTime": validTime,
        "dayTime": dayTime,
        "createTime": createTime,
        "type": type,
        "isSelf": isSelf,
        "isShow": isShow,
        "isOpen": isOpen,
        "slider_image": sliderImage,
        "tags": tags,
        "foodTypes": foodTypes,
        "avgPrice": avgPrice,
        "saleNum": saleNum,
        "openDay": openDay,
        "validTimeEnd": validTimeEnd,
        "validTimeStart": validTimeStart,
        "dayTimeStart": dayTimeStart,
        "dayTimeEnd": dayTimeEnd,
        "adSort": adSort,
        "email": email,
        "companyName": companyName,
        "brandName": brandName,
        "license": license,
        "permit": permit,
        "idFront": idFront,
        "idReverse": idReverse,
        "distance": distance,
        "storeProducts": List<dynamic>.from(storeProducts.map((x) => x.toJson())),
    };
}

class StoreProduct {
    StoreProduct({
        required this.allCommission,
        required this.auditInfo,
        this.auditor,
        required this.barCode,
        this.brand,
        this.brandName,
        required this.browse,
        required this.cateId,
        required this.codePath,
        required this.commentCount,
        required this.cost,
        required this.createTime,
        required this.creator,
        required this.description,
        required this.djCount,
        required this.ficti,
        required this.foodDescription,
        required this.giveIntegral,
        required this.id,
        required this.image,
        required this.isAudit,
        required this.isBargain,
        required this.isBenefit,
        required this.isBest,
        required this.isExclusive,
        required this.isGood,
        required this.isHot,
        required this.isNew,
        required this.isPostage,
        required this.isSeckill,
        required this.isShow,
        required this.isSub,
        required this.keyword,
        required this.merId,
        required this.merUse,
        required this.otPrice,
        required this.platCommission,
        required this.postage,
        required this.price,
        required this.sales,
        required this.selfBuyMoney,
        required this.sellLimit,
        required this.settleType,
        required this.sliderImage,
        required this.sort,
        required this.specType,
        required this.stock,
        required this.storeCategory,
        required this.storeInfo,
        required this.storeName,
        required this.supplyPrice,
        required this.tempId,
        required this.thirdCompareName,
        required this.thirdPrice,
        required this.type,
        required this.unitName,
        required this.updateTime,
        required this.vipPrice,
    });

    double allCommission;
    String auditInfo;
    dynamic auditor;
    String barCode;
    dynamic brand;
    dynamic brandName;
    int browse;
    String cateId;
    String codePath;
    int commentCount;
    double cost;
    DateTime createTime;
    int creator;
    String description;
    int djCount;
    int ficti;
    dynamic foodDescription;
    double giveIntegral;
    int id;
    String image;
    int isAudit;
    dynamic isBargain;
    int isBenefit;
    int isBest;
    int isExclusive;
    int isGood;
    int isHot;
    int isNew;
    int isPostage;
    int isSeckill;
    int isShow;
    int isSub;
    String keyword;
    int merId;
    int merUse;
    double otPrice;
    double platCommission;
    double postage;
    double price;
    int sales;
    double selfBuyMoney;
    int sellLimit;
    String settleType;
    String sliderImage;
    int sort;
    int specType;
    int stock;
    dynamic storeCategory;
    String storeInfo;
    String storeName;
    double supplyPrice;
    dynamic tempId;
    String thirdCompareName;
    double thirdPrice;
    int type;
    String unitName;
    String updateTime;
    double vipPrice;

    factory StoreProduct.fromJson(Map<String, dynamic> json) => StoreProduct(
        allCommission: json["allCommission"],
        auditInfo: json["auditInfo"],
        auditor: json["auditor"],
        barCode: json["barCode"],
        brand: json["brand"],
        brandName: json["brandName"],
        browse: json["browse"],
        cateId: json["cateId"],
        codePath: json["codePath"],
        commentCount: json["commentCount"],
        cost: json["cost"],
        createTime: DateTime.parse(json["createTime"]),
        creator: json["creator"],
        description: json["description"],
        djCount: json["djCount"],
        ficti: json["ficti"],
        foodDescription: json["foodDescription"],
        giveIntegral: json["giveIntegral"],
        id: json["id"],
        image: json["image"],
        isAudit: json["isAudit"],
        isBargain: json["isBargain"],
        isBenefit: json["isBenefit"],
        isBest: json["isBest"],
        isExclusive: json["isExclusive"],
        isGood: json["isGood"],
        isHot: json["isHot"],
        isNew: json["isNew"],
        isPostage: json["isPostage"],
        isSeckill: json["isSeckill"],
        isShow: json["isShow"],
        isSub: json["isSub"],
        keyword: json["keyword"],
        merId: json["merId"],
        merUse: json["merUse"],
        otPrice: json["otPrice"],
        platCommission: json["platCommission"],
        postage: json["postage"],
        price: json["price"],
        sales: json["sales"],
        selfBuyMoney: json["selfBuyMoney"].toDouble(),
        sellLimit: json["sellLimit"],
        settleType: json["settleType"],
        sliderImage: json["sliderImage"],
        sort: json["sort"],
        specType: json["specType"],
        stock: json["stock"],
        storeCategory: json["storeCategory"],
        storeInfo: json["storeInfo"],
        storeName: json["storeName"],
        supplyPrice: json["supplyPrice"],
        tempId: json["tempId"],
        thirdCompareName: json["thirdCompareName"],
        thirdPrice: json["thirdPrice"],
        type: json["type"],
        unitName: json["unitName"],
        updateTime:  json["updateTime"],
        vipPrice: json["vipPrice"],
    );

    Map<String, dynamic> toJson() => {
        "allCommission": allCommission,
        "auditInfo": auditInfo,
        "auditor": auditor,
        "barCode": barCode,
        "brand": brand,
        "brandName": brandName,
        "browse": browse,
        "cateId": cateId,
        "codePath": codePath,
        "commentCount": commentCount,
        "cost": cost,
        "createTime": createTime.toIso8601String(),
        "creator": creator,
        "description": description,
        "djCount": djCount,
        "ficti": ficti,
        "foodDescription": foodDescription,
        "giveIntegral": giveIntegral,
        "id": id,
        "image": image,
        "isAudit": isAudit,
        "isBargain": isBargain,
        "isBenefit": isBenefit,
        "isBest": isBest,
        "isExclusive": isExclusive,
        "isGood": isGood,
        "isHot": isHot,
        "isNew": isNew,
        "isPostage": isPostage,
        "isSeckill": isSeckill,
        "isShow": isShow,
        "isSub": isSub,
        "keyword": keyword,
        "merId": merId,
        "merUse": merUse,
        "otPrice": otPrice,
        "platCommission": platCommission,
        "postage": postage,
        "price": price,
        "sales": sales,
        "selfBuyMoney": selfBuyMoney,
        "sellLimit": sellLimit,
        "settleType": settleType,
        "sliderImage": sliderImage,
        "sort": sort,
        "specType": specType,
        "stock": stock,
        "storeCategory": storeCategory,
        "storeInfo": storeInfo,
        "storeName": storeName,
        "supplyPrice": supplyPrice,
        "tempId": tempId,
        "thirdCompareName": thirdCompareName,
        "thirdPrice": thirdPrice,
        "type": type,
        "unitName": unitName,
        "updateTime": updateTime,
        "vipPrice": vipPrice,
    };
}
