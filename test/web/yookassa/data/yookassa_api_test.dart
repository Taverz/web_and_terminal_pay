import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/parametr_api_const.dart';
import 'package:web_and_terminal_pay/web/yookassa/data/yookassa_api.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/amount/yookassa_amount_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/confirmation/yookassa_confirmation_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_confirmation_type_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_currency_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_payment_type_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/enums/yookassa_status_enum.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/payment_method/yookassa_payment_method_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/get/yookassa_refund_get_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/refund/post/yookassa_refund_post_model.dart';
import 'package:web_and_terminal_pay/web/yookassa/model/yookassa_payment_model.dart';

import 'yookassa_api_test.mocks.dart';

// ✓ YooKassaApi getHostPayment returns valid data on success
// ✓ YooKassaApi getHostPayment handles network error
// ✓ YooKassaApi createPayment returns valid data on success
// ✓ YooKassaApi createPayment handles bad response error
// ✓ YooKassaApi infoPaymentAfterCapture returns true for succeeded payment
// ✓ YooKassaApi infoPaymentAfterCapture handles timeout error
// ✓ YooKassaApi refundPayment returns a YookassaRefundGetModel
// ✓ YooKassaApi refundPayment handles server error
// ✓ YooKassaApi refundCheckPayment returns true for succeeded refund
// ✓ YooKassaApi refundCheckPayment handles network error

@GenerateMocks([Dio])
void main() {
  late YooKassaApi api;
  late MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    api = YooKassaApi(
      dio: mockDio,
    );
    api.dio = mockDio;
  });

  group('YooKassaApi', () {
    const username = 'testUser';
    const password = 'testPass';
    const idempotenceKey = 'testIdempotenceKey';

    test('getHostPayment returns valid data on success', () async {
      final mockResponseData = {'test_key': 'test_value'};
      final response = Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDio.get(
        'me',
        options: anyNamed('options'),
      )).thenAnswer((_) async => response);

      final result =
          await api.getHostPayment(username: username, password: password);

      expect(result, mockResponseData);
    });

    test('getHostPayment handles network error', () async {
      when(mockDio.get(
        'me',
        options: anyNamed('options'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: 'me'),
        type: DioExceptionType.connectionTimeout,
      ));

      expect(
        () => api.getHostPayment(username: username, password: password),
        throwsA(isA<DioException>()),
      );
    });

    test('createPayment returns valid data on success', () async {
      final paymentModel = YookassaPaymentModel(
        id: "wknwe9238dhqhd83eudiew",
        paid: false,
        amount: YookassaAmountModel(
          value: 10.0,
          currency: YookassaCurrencyEnum.rub,
        ),
        confirmation: YookassaConfirmationModel(
          type: YookassaConfirmationTypeEnum.redirect,
          confirmationUrl: null,
          returnUrl: null,
        ),
        paymentMethodModel: YookassaPaymentMethodModel(
          type: YookassaPaymentTypeEnum.sbp,
        ),
        capture: true,
        description: 'Pay <company name>',
      );
      final mockResponseData = {'test_key': 'test_value'};
      final response = Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDio.post(
        '${ParameterYookassaApi.host}payments',
        options: anyNamed('options'),
        data: paymentModel.toJson(),
      )).thenAnswer((_) async => response);

      final result = await api.createPayment(
        paymentModel: paymentModel,
        username: username,
        password: password,
        idempotenceKey: idempotenceKey,
      );

      expect(result, mockResponseData);
    });

    test('createPayment handles bad response error', () async {
      final paymentModel = YookassaPaymentModel(
        id: "wknwe9238dhqhd83eudiew",
        paid: false,
        amount: YookassaAmountModel(
          value: 10.0,
          currency: YookassaCurrencyEnum.rub,
        ),
        confirmation: YookassaConfirmationModel(
          type: YookassaConfirmationTypeEnum.redirect,
          confirmationUrl: null,
          returnUrl: null,
        ),
        paymentMethodModel: YookassaPaymentMethodModel(
          type: YookassaPaymentTypeEnum.sbp,
        ),
        capture: true,
        description: 'Pay <company name>',
      );

      when(mockDio.post(
        '${ParameterYookassaApi.host}payments',
        options: anyNamed('options'),
        data: paymentModel.toJson(),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: 'payments'),
        type: DioExceptionType.badResponse,
      ));

      expect(
        () => api.createPayment(
          paymentModel: paymentModel,
          username: username,
          password: password,
          idempotenceKey: idempotenceKey,
        ),
        throwsA(isA<DioException>()),
      );
    });

    test('infoPaymentAfterCapture returns true for succeeded payment',
        () async {
      const paymentId = 'testPaymentId';

      final mockResponseData = {'status': 'succeeded'};
      final response = Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDio.get(
        'payments/$paymentId',
        options: anyNamed('options'),
      )).thenAnswer((_) async => response);

      final result = await api.infoPaymentAfterCapture(
        paymentId: paymentId,
        username: username,
        password: password,
      );

      expect(result, true);
    });

    test('infoPaymentAfterCapture handles timeout error', () async {
      const paymentId = 'testPaymentId';

      when(mockDio.get(
        'payments/$paymentId',
        options: anyNamed('options'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: 'payments/$paymentId'),
        type: DioExceptionType.receiveTimeout,
      ));

      expect(
        () => api.infoPaymentAfterCapture(
          paymentId: paymentId,
          username: username,
          password: password,
        ),
        throwsA(isA<DioException>()),
      );
    });

    test('refundPayment returns a YookassaRefundGetModel', () async {
      final refundModel = YookassaRefundPostModel(
        paymentId: 'wknwe9238dhqhd83eudiew',
        amount: YookassaAmountModel(
          value: 10.0,
          currency: YookassaCurrencyEnum.rub,
        ),
      );

      final mockResponseData = {
        "payment_id": "wknwe9238dhqhd83eudiew",
        "id": "wknwe9238dhqhd83eudiew",
        "amount": {"value": 10.0, "currency": "RUB"},
        "status": "pending"
      };

      final resultResponse = Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDio.post(
        'https://api.yookassa.ru/v3/refunds',
        options: anyNamed('options'),
        data: jsonEncode(refundModel.toJson()),
      )).thenAnswer((_) async => resultResponse);

      final resultRequest = await api.refundPayment(
        refundModel: refundModel,
        username: username,
        password: password,
        idempotenceKey: idempotenceKey,
      );
      final resultModel = YookassaRefundGetModel.fromJson(resultResponse.data!);

      expect(
        resultRequest.status,
        YookassaPayStatusEnum.pending,
      );
      expect(
        resultModel.status,
        YookassaPayStatusEnum.pending,
      );
    });

    test('refundPayment handles server error', () async {
      final refundModel = YookassaRefundPostModel(
        paymentId: 'wknwe9238dhqhd83eudiew',
        amount: YookassaAmountModel(
          value: 10.0,
          currency: YookassaCurrencyEnum.rub,
        ),
      );

      when(mockDio.post(
        'https://api.yookassa.ru/v3/refunds',
        options: anyNamed('options'),
        data: jsonEncode(refundModel.toJson()),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: 'refunds'),
        type: DioExceptionType.badResponse,
      ));

      expect(
        () => api.refundPayment(
          refundModel: refundModel,
          username: username,
          password: password,
          idempotenceKey: idempotenceKey,
        ),
        throwsA(isA<DioException>()),
      );
    });

    test('refundCheckPayment returns true for succeeded refund', () async {
      const refundId = 'testRefundId';

      final mockResponseData = {
        "payment_id": "wknwe9238dhqhd83eudiew",
        "id": "wknwe9238dhqhd83eudiew",
        "amount": {"value": 10.0, "currency": "RUB"},
        "status": "succeeded"
      };
      final response = Response(
        data: mockResponseData,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );

      when(mockDio.get(
        'refunds/$refundId',
        options: anyNamed('options'),
      )).thenAnswer((_) async => response);

      final result = await api.refundCheckPayment(
        refundId: refundId,
        username: username,
        password: password,
      );

      expect(result, true);
    });

    test('refundCheckPayment handles network error', () async {
      const refundId = 'testRefundId';

      when(mockDio.get(
        'refunds/$refundId',
        options: anyNamed('options'),
      )).thenThrow(DioException(
        requestOptions: RequestOptions(path: 'refunds/$refundId'),
        type: DioExceptionType.connectionTimeout,
      ));

      expect(
        () => api.refundCheckPayment(
          refundId: refundId,
          username: username,
          password: password,
        ),
        throwsA(isA<DioException>()),
      );
    });
  });
}
