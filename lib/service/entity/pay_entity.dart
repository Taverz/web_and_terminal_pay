// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:atol_online_dart/atol_online_v1_4/model/check_atol_entity.dart';
import 'package:collection/collection.dart';
import 'package:web_and_terminal_pay/service/entity/enum_payment_object_check.dart';
// import 'package:web_and_terminal_pay/service/entity/payment_methods.dart';

class PayEntity {
  final String idTransaction;
  final String clientId;
  final String idempotenceKey;
  final double amountFull;
  final String? emailClient;
  final String? phoneClient;
  final String? callbackUrl;
  final String? descriptionPay;
  // final PaymentMethodEntity methodPay;
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
          PaymentObjectCheck.from(map['paymentObjectCheck'] as String) ??
              PaymentObjectCheck.service,
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
