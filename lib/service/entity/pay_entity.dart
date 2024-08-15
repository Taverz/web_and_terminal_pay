import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';

class PayEntity {
  final String idTransaction;
  final String clientId;
  final String idempotenceKey;
  final double amountFull;
  final String? emailClient;
  final String? phoneClient;
  final String callbackUrl;
  final String? descriptionPay;
  final List<ItemListModelSS> items;
  PayEntity({
    required this.idTransaction,
    required this.clientId,
    required this.idempotenceKey,
    required this.amountFull,
    this.emailClient,
    this.phoneClient,
    required this.callbackUrl,
    this.descriptionPay,
    required this.items,
  });

  PayEntity copyWith({
    String? idTransaction,
    String? clientId,
    String? idempotenceKey,
    double? amountFull,
    String? emailClient,
    String? phoneClient,
    String? callbackUrl,
    String? descriptionPay,
    List<ItemListModelSS>? items,
  }) {
    return PayEntity(
      idTransaction: idTransaction ?? this.idTransaction,
      clientId: clientId ?? this.clientId,
      idempotenceKey: idempotenceKey ?? this.idempotenceKey,
      amountFull: amountFull ?? this.amountFull,
      emailClient: emailClient ?? this.emailClient,
      phoneClient: phoneClient ?? this.phoneClient,
      callbackUrl: callbackUrl ?? this.callbackUrl,
      descriptionPay: descriptionPay ?? this.descriptionPay,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idTransaction': idTransaction,
      'clientId': clientId,
      'idempotenceKey': idempotenceKey,
      'amountFull': amountFull,
      'emailClient': emailClient,
      'phoneClient': phoneClient,
      'callbackUrl': callbackUrl,
      'descriptionPay': descriptionPay,
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory PayEntity.fromMap(Map<String, dynamic> map) {
    return PayEntity(
      idTransaction: map['idTransaction'] as String,
      clientId: map['clientId'] as String,
      idempotenceKey: map['idempotenceKey'] as String,
      amountFull: map['amountFull'] as double,
      emailClient:
          map['emailClient'] != null ? map['emailClient'] as String : null,
      phoneClient:
          map['phoneClient'] != null ? map['phoneClient'] as String : null,
      callbackUrl: map['callbackUrl'] as String,
      descriptionPay: map['descriptionPay'] != null
          ? map['descriptionPay'] as String
          : null,
      items: List<ItemListModelSS>.from(
        (map['items'] as List<int>).map<ItemListModelSS>(
          (x) => ItemListModelSS.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory PayEntity.fromJson(String source) =>
      PayEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PayEntity(idTransaction: $idTransaction, clientId: $clientId, idempotenceKey: $idempotenceKey, amountFull: $amountFull, emailClient: $emailClient, phoneClient: $phoneClient, callbackUrl: $callbackUrl, descriptionPay: $descriptionPay, items: $items)';
  }

  @override
  bool operator ==(covariant PayEntity other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.idTransaction == idTransaction &&
        other.clientId == clientId &&
        other.idempotenceKey == idempotenceKey &&
        other.amountFull == amountFull &&
        other.emailClient == emailClient &&
        other.phoneClient == phoneClient &&
        other.callbackUrl == callbackUrl &&
        other.descriptionPay == descriptionPay &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode {
    return idTransaction.hashCode ^
        clientId.hashCode ^
        idempotenceKey.hashCode ^
        amountFull.hashCode ^
        emailClient.hashCode ^
        phoneClient.hashCode ^
        callbackUrl.hashCode ^
        descriptionPay.hashCode ^
        items.hashCode;
  }
}

class ItemCheck {
  String name;
  double price;
  double quantity;
  // double sum;
  String measurementUnit;
  PaymentObjectCheck paymentObjectCheck;
  ItemCheck({
    required this.name,
    required this.price,
    required this.quantity,
    this.measurementUnit = 'шт',
    this.paymentObjectCheck = PaymentObjectCheck.service,
  });

  ItemCheck copyWith({
    String? name,
    double? price,
    double? quantity,
    String? measurementUnit,
    PaymentObjectCheck? paymentObjectCheck,
  }) {
    return ItemCheck(
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      measurementUnit: measurementUnit ?? this.measurementUnit,
      paymentObjectCheck: paymentObjectCheck ?? this.paymentObjectCheck,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'quantity': quantity,
      'measurementUnit': measurementUnit,
      'paymentObjectCheck': paymentObjectCheck.totext,
    };
  }

  factory ItemCheck.fromMap(Map<String, dynamic> map) {
    return ItemCheck(
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as double,
      measurementUnit: map['measurementUnit'] as String,
      paymentObjectCheck:
          PaymentObjectCheck.fromString(map['paymentObjectCheck'] as String)!,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemCheck.fromJson(String source) =>
      ItemCheck.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemCheck(name: $name, price: $price, quantity: $quantity, measurementUnit: $measurementUnit, paymentObjectCheck: $paymentObjectCheck)';
  }

  @override
  bool operator ==(covariant ItemCheck other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.quantity == quantity &&
        other.measurementUnit == measurementUnit &&
        other.paymentObjectCheck == paymentObjectCheck;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        quantity.hashCode ^
        measurementUnit.hashCode ^
        paymentObjectCheck.hashCode;
  }
}

enum PaymentObjectCheck {
  commodity,
  excise,
  job,
  service,
  gamblingBet,
  gamblingPrize,
  lottery,
  lotteryPrize,
  intellectualActivity,
  payment,
  agentCommission,
  composite,
  another;

  static PaymentObjectCheck? fromString(String value) {
    switch (value) {
      case 'commodity':
        return PaymentObjectCheck.commodity;
      case 'excise':
        return PaymentObjectCheck.excise;
      case 'job':
        return PaymentObjectCheck.job;
      case 'service':
        return PaymentObjectCheck.service;
      case 'gambling_bet':
        return PaymentObjectCheck.gamblingBet;
      case 'gambling_prize':
        return PaymentObjectCheck.gamblingPrize;
      case 'lottery':
        return PaymentObjectCheck.lottery;
      case 'lottery_prize':
        return PaymentObjectCheck.lotteryPrize;
      case 'intellectual_activity':
        return PaymentObjectCheck.intellectualActivity;
      case 'payment':
        return PaymentObjectCheck.payment;
      case 'agent_commission':
        return PaymentObjectCheck.agentCommission;
      case 'composite':
        return PaymentObjectCheck.composite;
      case 'another':
        return PaymentObjectCheck.another;
      default:
        return null;
    }
  }

  static PaymentObjectCheck? from(String value) {
    switch (value) {
      case 'commodity':
        return PaymentObjectCheck.commodity;
      case 'excise':
        return PaymentObjectCheck.excise;
      case 'job':
        return PaymentObjectCheck.job;
      case 'service':
        return PaymentObjectCheck.service;
      case 'gambling_bet':
        return PaymentObjectCheck.gamblingBet;
      case 'gambling_prize':
        return PaymentObjectCheck.gamblingPrize;
      case 'lottery':
        return PaymentObjectCheck.lottery;
      case 'lottery_prize':
        return PaymentObjectCheck.lotteryPrize;
      case 'intellectual_activity':
        return PaymentObjectCheck.intellectualActivity;
      case 'payment':
        return PaymentObjectCheck.payment;
      case 'agent_commission':
        return PaymentObjectCheck.agentCommission;
      case 'composite':
        return PaymentObjectCheck.composite;
      case 'another':
        return PaymentObjectCheck.another;
      default:
        return null;
    }
  }
}

extension PaymentObjectExtension on PaymentObjectCheck {
  String get totext {
    switch (this) {
      case PaymentObjectCheck.commodity:
        return 'commodity';
      case PaymentObjectCheck.excise:
        return 'excise';
      case PaymentObjectCheck.job:
        return 'job';
      case PaymentObjectCheck.service:
        return 'service';
      case PaymentObjectCheck.gamblingBet:
        return 'gambling_bet';
      case PaymentObjectCheck.gamblingPrize:
        return 'gambling_prize';
      case PaymentObjectCheck.lottery:
        return 'lottery';
      case PaymentObjectCheck.lotteryPrize:
        return 'lottery_prize';
      case PaymentObjectCheck.intellectualActivity:
        return 'intellectual_activity';
      case PaymentObjectCheck.payment:
        return 'payment';
      case PaymentObjectCheck.agentCommission:
        return 'agent_commission';
      case PaymentObjectCheck.composite:
        return 'composite';
      case PaymentObjectCheck.another:
        return 'another';
    }
  }
}

extension PayEntityAtolSbertermianlExt on PayEntity {
  SendPosPaymentModel payModelSberTerminal() => SendPosPaymentModel(
        clientId: clientId,
        idempotenceKeyERN: idempotenceKey,
        amount: amountFull,
      );
  ModelSS checkModelAtol() {
    final List<ItemCheck> itemsCheck = items.map((item) {
      return ItemCheck(
        name: item.name,
        price: item.price,
        quantity: item.quantity,
        measurementUnit: item.measurementUnit,
        paymentObjectCheck:
            PaymentObjectCheck.fromString(item.paymentObject.totext)!,
      );
    }).toList();

    return ModelSS(
      idempotenceKeyERN: idempotenceKey,
      emailClient: emailClient,
      phoneClient: phoneClient,
      callbackUrl: callbackUrl,
      items: itemsCheck.map((e) => ItemListModelSS.from(e.toMap())).toList(),
    );
  }
}
