import 'enums.dart';

class Balance {
  String asset;
  double free;
  double locked;

  Balance.fromMap(Map m)
      : asset = m['asset'] ?? m['a'],
        free = double.parse(m['free'] ?? m['f']),
        locked = double.parse(m['locked'] ?? m['l']);

  // toJson
  Map toJson() {
    return {"asset": asset, "free": free, "locked": locked};
  }
}

class AggTrade {
  int tradeId;
  double price;
  double qty;
  int firstTradeId;
  int lastTradeId;
  int timestamp;
  bool isBuyerMaker;
  bool isBestPriceMatch;

  AggTrade.fromMap(Map m)
      : tradeId = m['a'],
        price = double.parse(m['p']),
        qty = double.parse(m['q']),
        firstTradeId = m['f'],
        lastTradeId = m['l'],
        timestamp = m['T'],
        isBuyerMaker = m['m'],
        isBestPriceMatch = m['M'];

  // toJson
  Map toJson() {
    return {
      "tradeId": tradeId,
      "price": price,
      "qty": qty,
      "firstTradeId": firstTradeId,
      "lastTradeId": lastTradeId,
      "timestamp": timestamp,
      "isBuyerMaker": isBuyerMaker,
      "isBestPriceMatch": isBestPriceMatch
    };
  }
}

class WsAccountUpdate {
  String eventType;
  int eventTime;
  int lastUpdateTime;
  List<Balance> balances;

  WsAccountUpdate.fromMap(Map m)
      : eventType = m['e'],
        eventTime = m['E'],
        lastUpdateTime = m['u'],
        balances =
            (m['B'] as List<dynamic>).map((e) => Balance.fromMap(e)).toList();

  // toJson
  Map toJson() {
    return {
      "eventType": eventType,
      "eventTime": eventTime,
      "lastUpdateTime": lastUpdateTime,
      "balances": balances.map((e) => e.toJson()).toList
    };
  }
}

class WsBalanceUpdate {
  String eventType;
  int eventTime;
  String asset;
  double delta;
  int clearTime;

  WsBalanceUpdate.fromMap(Map m)
      : eventType = m['e'],
        eventTime = m['E'],
        asset = m['a'],
        delta = double.parse(m['d']),
        clearTime = m['T'];

  // toJson
  Map toJson() {
    return {
      "eventType": eventType,
      "eventTime": eventTime,
      "asset": asset,
      "delta": delta,
      "clearTime": clearTime
    };
  }
}

class WsExecutionReport {
  String eventType;
  int eventTime;
  String symbol;
  String clientOrderId;
  Side side;
  OrderType orderType;
  TimeInForce timeInForce;
  double qty;
  double price;
  double stopPrice;
  double icebergQty;
  int orderListID;
  String origClientOrderId;
  String executionType;
  OrderStatus orderStatus;
  String orderRejectReason;
  int orderId;
  double lastExecutedQty;
  double cumFilledQty;
  double lastExecutedPrice;
  double commissionAmount;
  String commissionAsset;
  int transactionTime;
  int tradeId;
  bool isOnTheBook;
  bool isMakerSide;
  int orderCreationTime;
  double cumQuoteAssetQty;
  double lastQuoteAssetQty;
  double quoteQty;

  WsExecutionReport.fromMap(Map m)
      : eventType = m['e'],
        eventTime = m['E'],
        symbol = m['s'],
        clientOrderId = m['c'],
        side = Side.fromString(m['S'] as String),
        orderType = OrderType.fromString(m['o'] as String),
        timeInForce = TimeInForce.fromString(m['f'] as String),
        qty = double.parse(m['q']),
        price = double.parse(m['p']),
        stopPrice = double.parse(m['P']),
        icebergQty = double.parse(m['F']),
        orderListID = m['g'],
        origClientOrderId = m['C'],
        executionType = m['x'],
        orderStatus = OrderStatus.fromString(m['X'] as String),
        orderRejectReason = m['r'],
        orderId = m['i'],
        lastExecutedQty = double.parse(m['l']),
        cumFilledQty = double.parse(m['z']),
        lastExecutedPrice = double.parse(m['L']),
        commissionAmount = double.parse(m['n']),
        commissionAsset = m['N'] ?? "",
        transactionTime = m['T'],
        tradeId = m['t'],
        isOnTheBook = m['w'],
        isMakerSide = m['m'],
        orderCreationTime = m['O'],
        cumQuoteAssetQty = double.parse(m['Z']),
        lastQuoteAssetQty = double.parse(m['Y']),
        quoteQty = double.parse(m['Q']);

  // toJson
  Map toJson() {
    return {
      "eventType": eventType,
      "eventTime": eventTime,
      "symbol": symbol,
      "clientOrderId": clientOrderId,
      "side": side.str,
      "orderType": orderType.str,
      "timeInForce": timeInForce.str,
      "qty": qty,
      "price": price,
      "stopPrice": stopPrice,
      "icebergQty": icebergQty,
      "orderListID": orderListID,
      "origClientOrderId": origClientOrderId,
      "executionType": executionType,
      "orderStatus": orderStatus.str,
      "orderRejectReason": orderRejectReason,
      "orderId": orderId,
      "lastExecutedQty": lastExecutedQty,
      "cumFilledQty": cumFilledQty,
      "lastExecutedPrice": lastExecutedPrice,
      "commissionAmount": commissionAmount,
      "commissionAsset": commissionAsset,
      "transactionTime": transactionTime,
      "tradeId": tradeId,
      "isOnTheBook": isOnTheBook,
      "isMakerSide": isMakerSide,
      "orderCreationTime": orderCreationTime,
      "cumQuoteAssetQty": cumQuoteAssetQty,
      "lastQuoteAssetQty": lastQuoteAssetQty,
      "quoteQty": quoteQty
    };
  }
}

class WsOcoOrder {
  String symbol;
  int orderId;
  String clientOrderId;

  WsOcoOrder.fromMap(Map m)
      : symbol = m['s'],
        orderId = m['i'],
        clientOrderId = m['c'];

  // toJson
  Map toJson() {
    return {
      "symbol": symbol,
      "orderId": orderId,
      "clientOrderId": clientOrderId
    };
  }
}

class WsListOrderStatus {
  String eventType;
  int eventTime;
  String symbol;
  int orderListId;
  String contingencyType;
  String listStatusType;
  String listOrderStatus;
  String listRejectReason;
  String listClientOrderId;
  int transactionTime;
  List<WsOcoOrder> orders;

  WsListOrderStatus.fromMap(Map m)
      : eventType = m['e'],
        eventTime = m['E'],
        symbol = m['s'],
        orderListId = m['g'],
        contingencyType = m['c'],
        listStatusType = m['l'],
        listOrderStatus = m['L'],
        listRejectReason = m['r'],
        listClientOrderId = m['C'],
        transactionTime = m['T'],
        orders = (m['O'] as List<dynamic>)
            .map((e) => WsOcoOrder.fromMap(e))
            .toList();

  // toJson
  Map toJson() {
    return {
      "eventType": eventType,
      "eventTime": eventTime,
      "symbol": symbol,
      "orderListId": orderListId,
      "contingencyType": contingencyType,
      "listStatusType": listStatusType,
      "listOrderStatus": listOrderStatus,
      "listRejectReason": listRejectReason,
      "listClientOrderId": listClientOrderId,
      "transactionTime": transactionTime,
      "orders": orders.map((e) => e.toJson()).toList
    };
  }
}

class DepthOrder {
  double price;
  double qty;

  DepthOrder.fromList(List l)
      : price = l[0],
        qty = l[1];

  // toJson
  Map toJson() {
    return {"price": price, "qty": qty};
  }
}
