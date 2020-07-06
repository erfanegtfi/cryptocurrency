import 'package:cryptocurrency/model/coin.dart';
import 'package:flutter/material.dart';

import 'package:cryptocurrency/crypto_currency_list_page.dart';
import 'package:cryptocurrency/model/enums.dart';


/// show list of crypto currencies base on give coins IDs
/// use widget CryptoListWidget
/// [CryptoCurrencyID] choose coin list, set empty array to show all coins
/// [CryptoCurrencyPriceType] price type USD, EUR, default is USD
/// [CryptoCurrencyExchange] exchange type, default is binance
/// [header]  list title, don't set to hide
/// [itemClickCallBack] item click call back
/// 

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CryptoListWidget(
        [CryptoCurrencyID.BCH, CryptoCurrencyID.ETH], // choose coin list, set empty array to show all coins
          cryptoCurrencyPriceType: CryptoCurrencyPriceType.USD, // price type USD, EUR, default is USD
          cryptoCurrencyExchange: CryptoCurrencyExchange.binance, // exchange type, default is binance
          header: "title", // list title, don't set to hide
          itemClickCallBack: (Coin coin) { // item click call back
            print("${coin.name} clicked");
          }),
    );
  }
}
