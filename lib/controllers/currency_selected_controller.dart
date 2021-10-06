import 'package:get/get.dart';
import 'package:masscoinex/global/global_vals.dart';
import 'package:masscoinex/models/currency_selector_list_model.dart';
import 'package:masscoinex/models/dashboard_crypto_status_model.dart';
import 'package:masscoinex/views/screens/currency_selected/currency_list_screens/buy_screen.dart';
import 'package:masscoinex/views/screens/currency_selected/currency_list_screens/deposit_screen.dart';
import 'package:masscoinex/views/screens/currency_selected/currency_list_screens/sell_screen.dart';
import 'package:masscoinex/views/screens/currency_selected/currency_list_screens/swap_screen.dart';
import 'package:masscoinex/views/screens/currency_selected/currency_list_screens/withdraw_screen.dart';

class CurrencySelectedController extends GetxController {
  var selectedIndex = 0.obs;
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
  var currencySelectedList = [
    CurrencySelectorListModel(
        id: 1, money: "0", values: "SWAP", isSelected: true.obs),
    CurrencySelectorListModel(
        id: 2, money: "5", values: "BUY", isSelected: true.obs),
    CurrencySelectorListModel(
        id: 3, money: "0", values: "SELL", isSelected: true.obs),
    CurrencySelectorListModel(
        id: 4, money: "2", values: "DEPOSIT", isSelected: true.obs),
    CurrencySelectorListModel(
        id: 5, money: "0", values: "WITHDRAW", isSelected: true.obs),
  ];
  var currencyScreens = [
    CurrencySwapScreen(),
    BuyScreen(),
    SellScreen(),
    DepositScreen(),
    WithdrawScreen(),
  ];
}
