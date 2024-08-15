import 'dart:convert';

class CurrentSessionYookassa {
  final String? username;
  final String? password;
  final String? idempotenceKey;
  final String? paymentId;
  final String? refundId;
  final double? amount;
  CurrentSessionYookassa({
    this.username,
    this.password,
    this.idempotenceKey,
    this.paymentId,
    this.refundId,
    this.amount,
  });

  CurrentSessionYookassa.init({
    required this.username,
    required this.password,
    this.idempotenceKey,
    this.paymentId,
    this.refundId,
    this.amount,
  });

  CurrentSessionYookassa.clear({
    this.username,
    this.password,
    this.idempotenceKey,
    this.paymentId,
    this.refundId,
    this.amount,
  });

  CurrentSessionYookassa copyWith({
    String? username,
    String? password,
    String? idempotenceKey,
    String? paymentId,
    String? refundId,
    double? amount,
  }) {
    return CurrentSessionYookassa(
      username: username ?? this.username,
      password: password ?? this.password,
      idempotenceKey: idempotenceKey ?? this.idempotenceKey,
      paymentId: paymentId ?? this.paymentId,
      refundId: refundId ?? this.refundId,
      amount: amount ?? this.amount,
    );
  }

  CurrentSessionYookassa copyWithClear() {
    return CurrentSessionYookassa.clear();
  }

  @override
  bool operator ==(covariant CurrentSessionYookassa other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.idempotenceKey == idempotenceKey &&
        other.paymentId == paymentId &&
        other.refundId == refundId &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        idempotenceKey.hashCode ^
        paymentId.hashCode ^
        refundId.hashCode ^
        amount.hashCode;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'idempotenceKey': idempotenceKey,
      'paymentId': paymentId,
      'refundId': refundId,
      'amount': amount,
    };
  }

  factory CurrentSessionYookassa.fromMap(Map<String, dynamic> map) {
    return CurrentSessionYookassa(
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      idempotenceKey: map['idempotenceKey'] != null
          ? map['idempotenceKey'] as String
          : null,
      paymentId: map['paymentId'] != null ? map['paymentId'] as String : null,
      refundId: map['refundId'] != null ? map['refundId'] as String : null,
      amount: map['amount'] != null ? map['amount'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentSessionYookassa.fromJson(String source) =>
      CurrentSessionYookassa.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentSessionYookassa(username: $username, password: $password, idempotenceKey: $idempotenceKey, paymentId: $paymentId, refundId: $refundId, amount: $amount)';
  }
}
