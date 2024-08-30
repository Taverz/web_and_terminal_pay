import 'package:atol_online_dart/atol_online_v1_4/model/check_atol_entity.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/enum/payment_object.dart';
import 'package:web_and_terminal_pay/pos/model/pay/send/send_pos_payment_model.dart';
import 'package:web_and_terminal_pay/service/entity/enum_payment_object_check.dart';
import 'package:web_and_terminal_pay/service/entity/pay_entity.dart';

extension PayEntityAtolSbertermianlExt on PayEntity {
  SendPosPaymentModel payModelSberTerminal() => SendPosPaymentModel(
        clientId: clientId,
        idempotenceKeyERN: idempotenceKey,
        amount: amountFull,
      );
  CheckAtolEntity checkModelAtol() {
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

    return CheckAtolEntity(
      idempotenceKeyERN: idempotenceKey,
      emailClient: emailClient,
      phoneClient: phoneClient,
      callbackUrl: callbackUrl,
      items: itemsCheck.map((e) => ItemListModelSS.from(e.toMap())).toList(),
    );
  }
}
