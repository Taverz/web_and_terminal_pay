import 'package:atol_online_dart/atol_online_v1_4/atol_online_v4.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/check_atol_entity.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/check_local_model.dart';
import 'package:atol_online_dart/atol_online_v1_4/test_model/test_settings.dart';
import 'package:web_and_terminal_pay/check_service/atol/recipe/check_save_repository.dart';
import 'package:atol_online_dart/atol_online_v1_4/model/refund_model.dart'
    as refund_model;

/// Здесь не должно быть никакой логикик все вынести
/// в репозиторий и из репозитория возвращать enum,
/// чтобы можно было тестировать
class AtolCheckService {
  final CheckSaveRepository checkSaveLocal;
  AtolCheckService(this.checkSaveLocal);

  AtolOnlineV4? _atolCheck;

  Future<bool> auth({
    required Shop shop,
    required ModelSettings modelSettings,
  }) async {
    try {
      _atolCheck = AtolOnlineV4(
        settingStore: modelSettings,
        shop: shop,
      );
      await _atolCheck!.auth();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> check(CheckAtolEntity checkModel) async {
    if (_atolCheck == null) {
      throw Exception('No call auth() AtolOnlineV4');
    }
    try {
      await _atolCheck!.createCheck(
        checkModel,
        (checkFromSave) {
          checkSaveLocal.saveOneCheck(
            mapCurrentCheck: checkFromSave.toMap(),
            idCheck: checkFromSave.id,
          );
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkRefound(CheckAtolEntity checkModel) async {
    if (_atolCheck == null) {
      throw Exception('No call auth() AtolOnlineV4');
    }
    try {
      await _atolCheck!.createCheck(
        checkModel,
        (checkFromSave) {
          checkSaveLocal.saveOneCheck(
            mapCurrentCheck: checkFromSave.toMap(),
            idCheck: checkFromSave.id,
          );
        },
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map<String, CheckLocal>> getAllCheckToCycle() async {
    final data = await checkSaveLocal.getAllChecks();
    final dyn = Map<String, dynamic>.from(data);
    // final convert = Map<String, CheckAtolEntity>.from(dyn);
    // Convert to Map<String, CheckAtolEntity>
    Map<String, CheckLocal> convert = dyn.map((key, value) {
      return MapEntry(key, CheckLocal.fromMap(value as Map<String, dynamic>));
    });
    return convert;
    //data.map((key, value) => Map.from({ (key as int) : CheckAtolEntity.fromMap(value) }) ).cast();
  }

  Future<void> clearCheck() async {
    await checkSaveLocal.clearAllCheck();
  }

  Future<bool> refund(
    String idCheck, {
    required CheckLocal modelSaved,
  }) async {
    // throw UnsupportedError('No support in current version');

    if (_atolCheck == null) {
      throw Exception('No call auth() AtolOnlineV4');
    }

    try {
      final timeStampCurrent = DateTime.timestamp().toUtc().toString();
      final refundModel = refund_model.RefundCheckAtol(
        externalId: modelSaved.id,
        receipt: modelSaved.receipt,
        service: modelSaved.service,
        timestamp: timeStampCurrent,
      );
      await _atolCheck!.refaundCheck(refundModel);
      await checkSaveLocal.deleteIdCheck(idCheck: idCheck);
      return true;
    } catch (e) {
      return false;
    }
  }
}
