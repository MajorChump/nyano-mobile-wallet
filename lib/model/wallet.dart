import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';
import 'package:nyano_mobile_flutter/model/available_currency.dart';
import 'package:nyano_mobile_flutter/network/model/response/account_history_response_item.dart';
import 'package:nyano_mobile_flutter/util/numberutil.dart';
import 'package:nyano_mobile_flutter/model/ratio.dart';

/// Main wallet object that's passed around the app via state
class AppWallet {
  static const String defaultRepresentative = 'nano_1gemini56efw4qrfzfcc71cky1wj7a6673fu5ue5afyyz55zb1cxkj8rkr1n';

  bool _loading; // Whether or not app is initially loading
  bool _historyLoading; // Whether or not we have received initial account history response
  String _address;
  BigInt _accountBalance;
  String _frontier;
  String _openBlock;
  String _representativeBlock;
  String _representative;
  String _localCurrencyPrice;
  String _btcPrice;
  int _blockCount;
  int confirmationHeight;
  List<AccountHistoryResponseItem> _history;


  AppWallet({String address, BigInt accountBalance, String frontier, String openBlock, String representativeBlock,
                String representative, String localCurrencyPrice,String btcPrice, int blockCount,
                List<AccountHistoryResponseItem> history, bool loading, bool historyLoading, this.confirmationHeight = -1}) {
    this._address = address;
    this._accountBalance = accountBalance ?? BigInt.zero;
    this._frontier = frontier;
    this._openBlock = openBlock;
    this._representativeBlock = representativeBlock;
    this._representative = representative;
    this._localCurrencyPrice = localCurrencyPrice ?? "0";
    this._btcPrice = btcPrice ?? "0";
    this._blockCount = blockCount ?? 0;
    this._history = history ?? new List<AccountHistoryResponseItem>();
    this._loading = loading ?? true;
    this._historyLoading = historyLoading  ?? true;
  }

  String get address => _address;

  set address(String address) {
    this._address = address;
  }

  BigInt get accountBalance => _accountBalance;

  set accountBalance(BigInt accountBalance) {
    this._accountBalance = accountBalance;
  }

  // Get pretty account balance version
  String getAccountBalanceDisplay() {
    if (accountBalance == null) {
      return "0";
    }
    return NumberUtil.getRawAsUsableString((_accountBalance * BigInt.from(Ratio.ratio)).toString());
  }

  String getLocalCurrencyPrice(AvailableCurrency currency, {String locale = "en_US"}) {
    Decimal converted = Decimal.parse(_localCurrencyPrice) * NumberUtil.getRawAsUsableDecimal(_accountBalance.toString());
    return NumberFormat.currency(locale:locale, symbol: currency.getCurrencySymbol()).format(converted.toDouble());
  }

  set localCurrencyPrice(String value) {
    _localCurrencyPrice = value;
  }

  String get localCurrencyConversion {
    return _localCurrencyPrice;
  }

  String get btcPrice {
    Decimal converted = Decimal.parse(_btcPrice) * NumberUtil.getRawAsUsableDecimal(_accountBalance.toString());
    // Show 4 decimal places for BTC price if its >= 0.0001 BTC, otherwise 6 decimals
    if (converted >= Decimal.parse("0.0001")) {
      return new NumberFormat("#,##0.0000", "en_US").format(converted.toDouble());
    } else {
      return new NumberFormat("#,##0.000000", "en_US").format(converted.toDouble());
    }
  }

  set btcPrice(String value) {
    _btcPrice = value;
  }

  String get representative {
   return _representative ?? defaultRepresentative;
  }

  set representative(String value) {
    _representative = value;
  }

  String get representativeBlock => _representativeBlock;

  set representativeBlock(String value) {
    _representativeBlock = value;
  }

  String get openBlock => _openBlock;

  set openBlock(String value) {
    _openBlock = value;
  }

  String get frontier => _frontier;

  set frontier(String value) {
    _frontier = value;
  }

  int get blockCount => _blockCount;

  set blockCount(int value) {
    _blockCount = value;
  }

  List<AccountHistoryResponseItem> get history => _history;

  set history(List<AccountHistoryResponseItem> value) {
    _history = value;
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
  }

  bool get historyLoading => _historyLoading;

  set historyLoading(bool value) {
    _historyLoading = value;
  }
}