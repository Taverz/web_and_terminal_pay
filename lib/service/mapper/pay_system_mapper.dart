import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';
import 'package:web_and_terminal_pay/service/entity/payment_methods.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/confirmation/yookassa_confirmation_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_confirmation_type_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_currency_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_payment_type_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/amount/yookassa_amount_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/payment_method/yookassa_payment_method_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/yookassa_payment_model.dart';

YookassaPaymentModel createPaymentModelServiceToYookassa(
  PayEntity paymentModel,
  PaymentMethodEntity? selectPaymentMethod,
) {
  final payModel = YookassaPaymentModel(
    id: paymentModel.idTransaction,
    paid: false,
    amount: YookassaAmountModel(
      currency: YookassaCurrencyEnum.rub,
      value: paymentModel.amountFull,
    ),
    confirmation: YookassaConfirmationModel(
      type: YookassaConfirmationTypeEnum.redirect,
      confirmationUrl: null,
      returnUrl: null,
    ),
    paymentMethodModel: YookassaPaymentMethodModel(
      type: convertYookassaTo(selectPaymentMethod!),
    ),
    capture: false,
    description: paymentModel.descriptionPay!,
  );
  return payModel;
}

List<PaymentMethodEntity> convertYookassa(List<String> payMethods) {
  List<PaymentMethodEntity> paymentMethods = [];
  for (final elem in payMethods) {
    PaymentMethodEntity? pt;
    switch (elem) {
      case 'bank_card':
        pt = PaymentMethodEntity.bankCard;
        break;
      case 'yoo_money':
        pt = PaymentMethodEntity.youMoney;
        break;
      case 'qiwi':
        pt = PaymentMethodEntity.qiwi;
        break;
      case 'sberbank':
        pt = PaymentMethodEntity.sberbank;
        break;
      case 'tinkoff_bank':
        pt = PaymentMethodEntity.tinkoffBank;
        break;
      case 'sbp':
        pt = PaymentMethodEntity.sbp;
        break;
    }
    pt != null ? paymentMethods.add(pt) : null;
  }
  return paymentMethods;
}

YookassaPaymentTypeEnum convertYookassaTo(PaymentMethodEntity payMethods) {
  switch (payMethods) {
    case PaymentMethodEntity.bankCard:
      return YookassaPaymentTypeEnum.bankCard;
    case PaymentMethodEntity.qiwi:
      return YookassaPaymentTypeEnum.qiwi;
    case PaymentMethodEntity.sberbank:
      return YookassaPaymentTypeEnum.sberbank;
    case PaymentMethodEntity.sbp:
      return YookassaPaymentTypeEnum.sbp;
    case PaymentMethodEntity.termianlSber:
      throw Exception(' no correct method pay');
    case PaymentMethodEntity.tinkoffBank:
      return YookassaPaymentTypeEnum.tinkoffBank;
    case PaymentMethodEntity.youMoney:
      return YookassaPaymentTypeEnum.youMoney;
  }
}
