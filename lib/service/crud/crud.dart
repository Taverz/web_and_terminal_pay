abstract class CRUDInterface {
  Future<void> init(String key);

  Future<void> putMap(Map<String, dynamic> value);
  Future<void> putList(List<dynamic> value);

  Future<void> updateMap(Map<String, dynamic> value);
  Future<void> updateList(List<dynamic> value);

  Future<void> deleteElementFromList(dynamic element);
  Future<void> deleteElementFromMap(String mapKey);

  Future<dynamic> getElementFromMap(String mapKey);
  Future<dynamic> getElementFromList(int index);

  Future<List<dynamic>> getAllList();
  Future<Map<String, dynamic>> getAllMap();

  Future<void> setParameter(String key, dynamic value);
  Future<dynamic> getParameter(String key);
}
