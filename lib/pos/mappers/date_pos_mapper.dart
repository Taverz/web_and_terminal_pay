import 'package:intl/intl.dart';

class PosMapper {
  const PosMapper();
  DateTime convertPosToDateTime({required String date, required String time}) {
    final dateFormat = DateFormat('dd MM HH:mm');
    final dateValue =
        '${date.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)} ")}';
    final timeValye =
        '${time.replaceAllMapped(RegExp(r".{2}"), (match) => "${match.group(0)}:")}';
    final replacerange = dateFormat.parse(
      '${dateValue}${timeValye}',
    );
    return replacerange;
  }
}
