class ApiRoutes {
  static const baseUrl = "https://test.masscoinex.com/api/";
  static const checkingUser = "checking-user";
  static const register = "register";
  static const login = "login";
  static const dashboard = "dashboard";
  static const dashboardData = "dashboard-data";
  static const kycUpgrade = "kyc-upgrade";
  static const currencySetup = "currency-setup";
  static const profileInfo = "get-profile";
  static const profileUpdate = "update-profile";
  static const addBank = "add-bank";
  static const updatePhoto = "update-photo";

  /* Buy */
  static const getFiatCryptoValue = "get-fiat-crypto-value";
  static const getFiatCryptoAmount = "get-fiat-crypto-amount";
  static const buyFiatToCrypto = "buy-fiat-to-crypto";
  static const history = "crypto-transaction-history";

  /*Sell*/
  static const getFiatSellCryptoValue = "get-fiat-sell-crypto-value";
  static const getFiatSellCryptoAmount = "get-fiat-sell-crypto-amount";
  static const saveSellCrypto = "save-sell-crypto";

  /*Withdraw*/
  static const getFiatWithdrawCryptoValue = "get-fiat-withdraw-crypto-value";
  static const saveWithdrawCrypto = "save-withdraw-crypto";

  /*Deposit*/
  static const getFiatRequestCryptoAmount = "get-fiat-request-crypto-amount";
  static const saveRequestCrypto = "save-request-crypto";

  /*Add Card*/
  static const addCard = "add-card";
  static const cardDocument = "card-document";
}
