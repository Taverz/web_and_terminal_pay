import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/parametr_api_const.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_status_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/yookassa_payment_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/get/yookassa_refund_get_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/post/yookassa_refund_post_model.dart';

class YooKassaApi {
  late Dio dio;

  YooKassaApi({
    required Dio dioW,
  }) {
    {
      final options = BaseOptions(
        baseUrl: ParameterYookassaApi.host,
        connectTimeout: const Duration(seconds: 15),
      );
      dioW.options = options;
      dio = dioW;
    }
  }

  void setParams({
    required String username,
    required String password,
  }) {
    dio.options = dio.options.copyWith(
      headers: {
        "Authorization":
            'Basic ${base64Encode(utf8.encode('$username:$password'))}'
      },
    );
  }

  Future<Map<String, dynamic>> getHostPayment() async {
    try {
      final response = await dio.get(
        'me',
      );
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw DioException.badResponse(
            statusCode: response.statusCode ?? -1,
            requestOptions: response.requestOptions,
            response: response);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createPayment({
    required YookassaPaymentModel paymentModel,
    required String username,
    required String password,
    required String idempotenceKey,
  }) async {
    final mapView = paymentModel.toJson();
    final result = await dio.post(
      "https://api.yookassa.ru/v3/payments",
      options: Options(
        headers: {"Idempotence-Key": idempotenceKey},
      ),
      data: mapView,
    );
    return result.data;
  }

  Future<bool> infoPaymentAfterCapture({
    required String paymentId,
    required String username,
    required String password,
  }) async {
    bool ret = false;
    Map<String, dynamic> body;
    final startTime = DateTime.now();
    do {
      final response = await dio.get(
        "payments/$paymentId",
      );
      body = response.data;
      ret = body["status"] == "succeeded" || body["status"] == "canceled";
      if (DateTime.now().difference(startTime).inSeconds >= 30) {
        break;
      }
      await Future.delayed(const Duration(seconds: 5));
    } while (!ret);
    return body["status"] == "succeeded" ? true : false;
  }

  Future<YookassaRefundGetModel> refundPayment({
    required YookassaRefundPostModel refundModel,
    required String username,
    required String password,
    required String idempotenceKey,
  }) async {
    final mapView = refundModel.toJson();
    final result = await dio.post(
      "https://api.yookassa.ru/v3/refunds",
      options: Options(
        headers: {"Idempotence-Key": idempotenceKey},
      ),
      data: jsonEncode(mapView),
    );
    // final resultDataExample = YookassaRefundGetModel.fromJson({
    //   "payment_id": "wknwe9238dhqhd83eudiew",
    //   "id": "wknwe9238dhqhd83eudiew",
    //   "amount": {"value": 10.0, "currency": "RUB"},
    //   "status": "pending"
    // });
    return YookassaRefundGetModel.fromJson(result.data);
  }

  Future<bool> refundCheckPayment({
    required String refundId,
    required String username,
    required String password,
  }) async {
    YookassaRefundGetModel answer;
    do {
      final result = await dio.get(
        "refunds/$refundId",
      );
      answer = YookassaRefundGetModel.fromJson(result.data);
    } while (answer.status == YookassaPayStatusEnum.pending);
    return answer.status == YookassaPayStatusEnum.succeeded ? true : false;
  }
}
