import 'dart:convert';

ItemDetailModel itemDetailModelFromJson(String str) =>
    ItemDetailModel.fromJson(json.decode(str));

String itemDetailModelToJson(ItemDetailModel data) =>
    json.encode(data.toJson());

class ItemDetailModel {
  int? bigintItemId;
  String? varBarcode;
  String? varItemNo;
  String? varItemDescription;
  String? varUomGroupCode;
  String? varUomGroupName;
  String? varUomCode;
  String? varUomName;
  String? varForeignName;
  String? varItemCategory;
  String? varBrandName;
  String? varGroupName;
  String? varItemImage;
  double? decLastMonthSalesQty;
  double? decLast90DaysSalesQty;
  double? decLastSellingPrice;
  int? intOpenOrders;
  int? intOpenInvoice;
  int? intOrdered;
  int? intCommitted;
  double? decItemCost;
  List<PriceList?>? priceList;
  List<WhStockItemMaster>? whStockItemMaster;

  ItemDetailModel({
    this.bigintItemId,
    this.varBarcode,
    this.varItemNo,
    this.varItemDescription,
    this.varUomGroupCode,
    this.varUomGroupName,
    this.varUomCode,
    this.varUomName,
    this.varForeignName,
    this.varItemCategory,
    this.varBrandName,
    this.varGroupName,
    this.varItemImage,
    this.decLastMonthSalesQty,
    this.decLast90DaysSalesQty,
    this.decLastSellingPrice,
    this.intOpenOrders,
    this.intOpenInvoice,
    this.intOrdered,
    this.intCommitted,
    this.decItemCost,
    this.priceList,
    this.whStockItemMaster,
  });

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) =>
      ItemDetailModel(
        bigintItemId: int.tryParse(json["bigintItemId"].toString()),
        varBarcode: json["varBarcode"],
        varItemNo: json["varItemNo"],
        varItemDescription: json["varItemDescription"],
        varUomGroupCode: json["varUOMGroupCode"],
        varUomGroupName: json["varUOMGroupName"],
        varUomCode: json["varUOMCode"],
        varUomName: json["varUOMName"],
        varForeignName: json["varForeignName"],
        varItemCategory: json["varItemCategory"],
        varBrandName: json["varBrandName"],
        varGroupName: json["varGroupName"],
        varItemImage: json["varItemImage"],
        decLastMonthSalesQty:
            double.tryParse(json["decLastMonthSalesQty"].toString()),
        decLast90DaysSalesQty:
            double.tryParse(json["decLast90DaysSalesQty"].toString()),
        decLastSellingPrice:
            double.tryParse(json["decLastSellingPrice"].toString()),
        intOpenOrders: int.tryParse(json["intOpenOrders"].toString()),
        intOpenInvoice: int.tryParse(json["intOpenInvoice"].toString()),
        intOrdered: int.tryParse(json["intOrdered"].toString()),
        intCommitted: int.tryParse(json["intCommitted"].toString()),
        decItemCost: double.tryParse(json["decItemCost"].toString()),
        priceList:
            json["priceList"] is List ? getPriceList(json["priceList"]) : null,
        whStockItemMaster: json["whStockItemMaster"] is List
            ? getWhStockItemMaster(json["whStockItemMaster"])
            : null,
      );

  static List<PriceList> getPriceList(List dynamicPriceList) {
    List<PriceList> priceList = [];
    for (var price in dynamicPriceList) {
      priceList.add(PriceList.fromJson(price));
    }
    return priceList;
  }

  static List<WhStockItemMaster> getWhStockItemMaster(List dynamicWhsStock) {
    List<WhStockItemMaster> whsStockList = [];
    for (var whsStock in dynamicWhsStock) {
      whsStockList.add(WhStockItemMaster.fromJson(whsStock));
    }
    return whsStockList;
  }

  Map<String, dynamic> toJson() => {
        "bigintItemId": bigintItemId,
        "varBarcode": varBarcode,
        "varItemNo": varItemNo,
        "varItemDescription": varItemDescription,
        "varUOMGroupCode": varUomGroupCode,
        "varUOMGroupName": varUomGroupName,
        "varUOMCode": varUomCode,
        "varUOMName": varUomName,
        "varForeignName": varForeignName,
        "varItemCategory": varItemCategory,
        "varBrandName": varBrandName,
        "varGroupName": varGroupName,
        "varItemImage": varItemImage,
        "decLastMonthSalesQty": decLastMonthSalesQty,
        "decLast90DaysSalesQty": decLast90DaysSalesQty,
        "decLastSellingPrice": decLastSellingPrice,
        "intOpenOrders": intOpenOrders,
        "intOpenInvoice": intOpenInvoice,
        "intOrdered": intOrdered,
        "intCommitted": intCommitted,
        "decItemCost": decItemCost,
    "priceList": priceList == null ? [] : List<dynamic>.from(priceList!.map((x) => x?.toJson())),
    "whStockItemMaster": whStockItemMaster == null ? [] : List<dynamic>.from(whStockItemMaster!.map((x) => x.toJson())),
      };
}

List<WhStockItemMaster> whStockItemMasterFromJson(String str) =>
    List<WhStockItemMaster>.from(
        json.decode(str).map((x) => WhStockItemMaster.fromJson(x)));

// String warehouseModelToJson(List<WarehouseModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WhStockItemMaster {
  String? varWarehouseCode;
  double? decInStock;

  WhStockItemMaster({
    this.varWarehouseCode,
    this.decInStock,
  });

  factory WhStockItemMaster.fromJson(Map<String, dynamic> json) =>
      WhStockItemMaster(
        varWarehouseCode: json["varWarehouseCode"],
        decInStock: double.tryParse(json["decInStock"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "varWarehouseCode": varWarehouseCode,
        "decInStock": decInStock,
      };
}

List<PriceList> priceListFromJson(String str) =>
    List<PriceList>.from(json.decode(str).map((x) => PriceList.fromJson(x)));

class PriceList {
  String? varPriceListName;
  String? varUomName;
  String? varCurrency;
  double? decPrice;

  PriceList({
    this.varPriceListName,
    this.varUomName,
    this.varCurrency,
    this.decPrice,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) => PriceList(
        varPriceListName: json["varPriceListName"],
        varUomName: json["varUOMName"],
        varCurrency: json["varCurrency"],
        decPrice: double.tryParse(json["decPrice"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "varPriceListName": varPriceListName,
        "varUOMName": varUomName,
        "varCurrency": varCurrency,
        "decPrice": decPrice,
      };
}
