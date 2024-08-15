// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionHistory {
  final List<Transaction> transaction;
  TransactionHistory({
    required this.transaction,
  });
}

class Transaction {
  final DateTime createAtUTC;
  final TransactionType transactionType;
  final double sumFull;
  final String idTransactionString;

  final bool payCalled;
  final bool checkCalled;
  final bool refundCalled;

  final String? checkPaySystem;
  final String? checkCheckSystem;
  final int? idTransactionInt;

  Transaction({
    required this.createAtUTC,
    required this.transactionType,
    required this.sumFull,
    required this.idTransactionString,
    this.payCalled = false,
    this.checkCalled = false,
    this.refundCalled = false,
    this.checkPaySystem,
    this.checkCheckSystem,
    this.idTransactionInt,
  });
}

enum TransactionType {
  crashBeforePay,
  crashAfterPay,
  noCreateCheck,
  refundPay,
  paySuccessAfterCheck
}
