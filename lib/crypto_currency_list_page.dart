library currency;

import 'dart:async';
import 'package:cryptocurrency/model/enums.dart';
import 'package:cryptocurrency/assets/proj_string.dart';
import 'package:cryptocurrency/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:cryptocurrency/model/coin.dart';
import 'package:cryptocurrency/config/constants.dart' as cons;
import 'dart:convert' show json;

import 'crypto_currency_body.dart';

/// show list of crypto currencies base on give coins IDs
/// [_cryptoIDList] is coin ids
/// [cryptoCurrencyPriceType] is price type
/// [cryptoCurrencyExchange] exchange name
/// [header] is list title, set empty to hide title
/// [itemClickCallBack] is item click call back method
///
class CryptoListWidget extends StatelessWidget {
  final List<CryptoCurrencyID> _cryptoIDList;
  final String header;
  final Function itemClickCallBack;
  final CryptoCurrencyPriceType cryptoCurrencyPriceType;
  final CryptoCurrencyExchange cryptoCurrencyExchange;

  CryptoListWidget(
    this._cryptoIDList, {
    this.cryptoCurrencyPriceType = CryptoCurrencyPriceType.USD,
    this.cryptoCurrencyExchange = CryptoCurrencyExchange.binance,
    this.header = "",
    this.itemClickCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none && projectSnap.hasData == null) {
          return Container(
            child: Text(ProjString.dataNotFount),
          );
        }
        if (projectSnap.data != null)
          return CryptoCurrencyBody(projectSnap.data, header: header, itemClickCallBack: itemClickCallBack);
        else
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
      },
      future: getCryptoCurrencies(cryptoCurrencyPriceType, cryptoCurrencyExchange),
    );
  }

  ///  load cryptocurrencies from url
  Future<List<Coin>> getCryptoCurrencies(
      CryptoCurrencyPriceType cryptoCurrencyPriceType, CryptoCurrencyExchange cryptoCurrencyExchange) async {
    String coinList = Utils.getCurrencyListString(_cryptoIDList);
    String priceType = Utils.getPriceTypeStr(cryptoCurrencyPriceType);
    String exchangeType = Utils.getExchangeTypeStr(cryptoCurrencyExchange);
    List<Coin> currencies = List<Coin>();
    String apiUrl =
        '${cons.cryptoCurrencyURL}${cons.cryptoURL_id}$coinList${cons.cryptoURL_convert}$priceType${cons.cryptoURL_exchange}$exchangeType';
    print(apiUrl);
    http.Response response = await http.get(apiUrl);
    List l = json.decode(response.body);
    l.forEach((v) {
      currencies.add(Coin.fromJson(v));
    });
    return currencies;
  }
}
