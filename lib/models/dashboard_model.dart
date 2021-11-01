// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  String code;
  String message;
  List<CryptoDatum> cryptoData;
  List<Notification> notifications;
  Wallet wallet;
  DashboardModel({
    required this.code,
    required this.message,
    required this.cryptoData,
    required this.notifications,
    required this.wallet,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        code: json["code"],
        message: json["message"],
        cryptoData: List<CryptoDatum>.from(
            json["crypto_data"].map((x) => CryptoDatum.fromJson(x))),
        notifications: List<Notification>.from(
            json["notifications"].map((x) => Notification.fromJson(x))),
        wallet: Wallet.fromJson(json["wallet"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "crypto_data": List<dynamic>.from(cryptoData.map((x) => x.toJson())),
        "notifications":
            List<dynamic>.from(notifications.map((x) => x.toJson())),
        "wallet": wallet.toJson(),
      };
}

class CryptoDatum {
  String coinName;
  String coinSymbol;
  String coinImage;
  String currencyCode;
  dynamic cryptoWallet;
  String buyPrice;
  String sellPrice;
  CryptoDatum({
    required this.coinName,
    required this.coinSymbol,
    required this.coinImage,
    required this.currencyCode,
    required this.cryptoWallet,
    required this.buyPrice,
    required this.sellPrice,
  });

  factory CryptoDatum.fromJson(Map<String, dynamic> json) => CryptoDatum(
        coinName: json["coin_name"],
        coinSymbol: json["coin_symbol"],
        coinImage: json["coin_image"],
        currencyCode: json["currency_code"],
        cryptoWallet: json["crypto_wallet"],
        buyPrice: json["buy_price"],
        sellPrice: json["sell_price"],
      );

  Map<String, dynamic> toJson() => {
        "coin_name": coinName,
        "coin_symbol": coinSymbol,
        "coin_image": coinImage,
        "currency_code": currencyCode,
        "crypto_wallet": cryptoWallet,
        "buy_price": buyPrice,
        "sell_price": sellPrice,
      };
}

class Notification {
  String notificationMsg;
  Notification({
    required this.notificationMsg,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        notificationMsg: json["notification_msg"],
      );

  Map<String, dynamic> toJson() => {
        "notification_msg": notificationMsg,
      };
}

class Wallet {
  dynamic userId;
  int amount;
  dynamic currency;
  Wallet({
    required this.userId,
    required this.amount,
    required this.currency,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        userId: json["user_id"],
        amount: json["amount"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "amount": amount,
        "currency": currency,
      };
}
