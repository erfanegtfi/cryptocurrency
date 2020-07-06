import 'package:cryptocurrency/model/coin.dart';
import 'package:flutter/material.dart';

import 'package:cryptocurrency/crypto_currency_list_page.dart';
import 'package:cryptocurrency/model/enums.dart';

class CryptoListWidgett extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CryptoListWidget(
        [CryptoCurrencyID.BCH], // choose coin list, set empty array to show all coins
          cryptoCurrencyPriceType: CryptoCurrencyPriceType.USD, // price type USD, EUR, default is USD
          cryptoCurrencyExchange: CryptoCurrencyExchange.binance, // exchange type, default is binance
          header: "title", // list title, don't set to hide
          itemClickCallBack: (Coin coin) { // item click call back
            print("${coin.name} cliced");
          }),
    );
  }
}
