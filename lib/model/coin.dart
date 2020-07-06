import 'coin_price_changes.dart';

class Coin {
  String id;
  String currency;
  String symbol;
  String name;
  String logoUrl;
  String price;
  String priceDate;
  String priceTimestamp;
  String circulatingSupply;
  String maxSupply;
  String marketCap;
  String rank;
  String high;
  String highTimestamp;
  CoinPriceChanges coinPriceChanges;

  Coin(
      {this.id,
      this.currency,
      this.symbol,
      this.name,
      this.logoUrl,
      this.price,
      this.priceDate,
      this.priceTimestamp,
      this.circulatingSupply,
      this.maxSupply,
      this.marketCap,
      this.rank,
      this.high,
      this.highTimestamp,
      this.coinPriceChanges});

  Coin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currency = json['currency'];
    symbol = json['symbol'];
    name = json['name'];
    logoUrl = json['logo_url'];
    price = json['price'];
    priceDate = json['price_date'];
    priceTimestamp = json['price_timestamp'];
    circulatingSupply = json['circulating_supply'];
    maxSupply = json['max_supply'];
    marketCap = json['market_cap'];
    rank = json['rank'];
    high = json['high'];
    highTimestamp = json['high_timestamp'];
    coinPriceChanges = json['1d'] != null ? new CoinPriceChanges.fromJson(json['1d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currency'] = this.currency;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['logo_url'] = this.logoUrl;
    data['price'] = this.price;
    data['price_date'] = this.priceDate;
    data['price_timestamp'] = this.priceTimestamp;
    data['circulating_supply'] = this.circulatingSupply;
    data['max_supply'] = this.maxSupply;
    data['market_cap'] = this.marketCap;
    data['rank'] = this.rank;
    data['high'] = this.high;
    data['high_timestamp'] = this.highTimestamp;
    if (this.coinPriceChanges != null) {
      data['1d'] = this.coinPriceChanges.toJson();
    }
    return data;
  }
}

