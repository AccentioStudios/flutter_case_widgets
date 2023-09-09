import 'package:shared_preferences/shared_preferences.dart';

abstract class IDataSource {
  Future addFavorite({required bool isFavorite, required String id});
  Future <bool> getFavorite({required String id});
  Future removeFavorite({required bool isFavorite, required String id});
}

class HomeDataSourceSharedPreferencesImpl extends IDataSource {

  @override
  Future addFavorite({required bool isFavorite, required String id}) async {
    final SharedPreferences dataSource = await SharedPreferences.getInstance();
    dataSource.setBool(id, isFavorite);
  }

  @override
  Future<bool> getFavorite({required String id}) async {
    try {
      final SharedPreferences dataSource = await SharedPreferences.getInstance();
     bool? responseId = dataSource.getBool(id);
     if (responseId == null){
      return false;
     }
    return responseId;
    } catch (e) {
      return true;
    }
    
  }

  @override
  Future removeFavorite({required bool isFavorite, required String id}) async {
    final SharedPreferences dataSource = await SharedPreferences.getInstance();
    dataSource.setBool(id, isFavorite);
  }
}