import 'package:get/get.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/dashboard_crypto_status_model.dart';

class CurrencySelectedController extends GetxController {
   var dashBoardCryptoStatusModels = [
    DashBoardCryptoStatusModel(
      cryptoAsset: "assets/bitcoin.png",
      cryptoName: "Bitcoin",
      cryptoNameSmall: "BTC",
      cryptoPrice: "0.02245",
      cryptoPriceDollarBuy: "\$12385",
      cryptoPriceDollarSell: "\$12585",
      priceColor: GlobalVals.raiseColor,
    ),
    DashBoardCryptoStatusModel(
      cryptoAsset: "assets/ripple.png",
      cryptoName: "Ripple",
      cryptoNameSmall: "RPL",
      cryptoPrice: "1.234",
      cryptoPriceDollarBuy: "\$1385",
      cryptoPriceDollarSell: "\$1885",
      priceColor: GlobalVals.raiseColor,
    ),
    DashBoardCryptoStatusModel(
      cryptoAsset: "assets/eos.png",
      cryptoName: "EOS",
      cryptoNameSmall: "EOS",
      cryptoPrice: "1.44",
      cryptoPriceDollarBuy: "\$2385",
      cryptoPriceDollarSell: "\$2485",
      priceColor: GlobalVals.raiseColor,
    ),
    DashBoardCryptoStatusModel(
      cryptoAsset: "assets/ether.png",
      cryptoName: "Ether",
      cryptoNameSmall: "ETH",
      cryptoPrice: "11.3456",
      cryptoPriceDollarBuy: "\$1185",
      cryptoPriceDollarSell: "\$1585",
      priceColor: GlobalVals.raiseColor,
    ),
    DashBoardCryptoStatusModel(
      cryptoAsset: "assets/ion.png",
      cryptoName: "Ion",
      cryptoNameSmall: "ION",
      cryptoPrice: "0.000324",
      cryptoPriceDollarBuy: "\$6385",
      cryptoPriceDollarSell: "\$6885",
      priceColor: GlobalVals.downColor,
    ),
  ];
}
