import 'package:web_and_terminal_pay/service/model/organization_pos_terminal_model.dart';

class CurrentOperation {
  final OrganizationPosTerminalSber? selectOrganization;
  final String idempotenceKeyERN;
  final String currentClientId;
  final double amount;
  final String? retrievalReferenceNumber;
  CurrentOperation({
    this.selectOrganization,
    required this.idempotenceKeyERN,
    required this.currentClientId,
    required this.amount,
    this.retrievalReferenceNumber,
  });

  CurrentOperation.empty({
    this.idempotenceKeyERN = '',
    this.currentClientId = '',
    this.amount = 0.0,
    this.selectOrganization,
    this.retrievalReferenceNumber,
  });

  CurrentOperation copyWith({
    OrganizationPosTerminalSber? selectOrganization,
    String? idempotenceKeyERN,
    String? currentClientId,
    double? amount,
    String? retrievalReferenceNumber,
  }) {
    return CurrentOperation(
      selectOrganization: selectOrganization ?? this.selectOrganization,
      idempotenceKeyERN: idempotenceKeyERN ?? this.idempotenceKeyERN,
      currentClientId: currentClientId ?? this.currentClientId,
      amount: amount ?? this.amount,
      retrievalReferenceNumber:
          retrievalReferenceNumber ?? this.retrievalReferenceNumber,
    );
  }
}
