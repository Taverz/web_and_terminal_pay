// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'send_pos_payment_model.freezed.dart';
// part 'send_pos_payment_model.g.dart';

// @freezed
// abstract class SendPosPaymentModel with _$SendPosPaymentModel {
//   factory SendPosPaymentModel({
//     required String clientId,
//     required String idempotenceKeyERN,
//     required double amount,
//   }) = _SendPosPaymentModel;

//   factory SendPosPaymentModel.fromJson(Map<String, dynamic> json) =>
//       _$SendPosPaymentModelFromJson(json);
// }

class SendPosPaymentModel {
  final String clientId;
  final String idempotenceKeyERN;
  final double amount;
  SendPosPaymentModel({
    required this.clientId,
    required this.idempotenceKeyERN,
    required this.amount,
  });

  SendPosPaymentModel copyWith({
    String? clientId,
    String? idempotenceKeyERN,
    double? amount,
  }) {
    return SendPosPaymentModel(
      clientId: clientId ?? this.clientId,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientId': clientId,
      'idempotenceKeyERN': idempotenceKeyERN,
      'amount': amount,
    };
  }

  factory SendPosPaymentModel.fromMap(Map<String, dynamic> map) {
    return SendPosPaymentModel(
      clientId: map['clientId'] as String,
      idempotenceKeyERN: map['idempotenceKeyERN'] as String,
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SendPosPaymentModel.fromJson(String source) =>
      SendPosPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SendPosPaymentModel(clientId: $clientId, idempotenceKeyERN: $idempotenceKeyERN, amount: $amount)';

  @override
  bool operator ==(covariant SendPosPaymentModel other) {
    if (identical(this, other)) return true;

    return other.clientId == clientId &&
        other.idempotenceKeyERN == idempotenceKeyERN &&
        other.amount == amount;
  }

  @override
  int get hashCode =>
      clientId.hashCode ^ idempotenceKeyERN.hashCode ^ amount.hashCode;
}
