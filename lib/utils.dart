import 'model/enums.dart';

class Utils {
  ///  convert crypto currency list to string
  static String getCurrencyListString(List<CryptoCurrencyID> currencies) {
    var concatenate = StringBuffer();

    currencies.forEach((item) {
      concatenate.write(item.toString().split('.').last);
      concatenate.write(",");
    });
    return concatenate.toString();
  }

  ///  convert price enum to string
  static String getPriceTypeStr(CryptoCurrencyPriceType cryptoCurrencyPriceType) {
    return cryptoCurrencyPriceType.toString().split('.').last;
  }

  ///  convert price enum to string
  static String getExchangeTypeStr(CryptoCurrencyExchange cryptoCurrencyExchange) {
    return cryptoCurrencyExchange.toString().split('.').last;
  }
}
