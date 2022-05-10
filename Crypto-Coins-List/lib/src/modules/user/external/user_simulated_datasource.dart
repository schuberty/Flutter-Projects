import 'dart:convert';

import 'package:crypto_list/src/modules/user/infra/datasources/user_datasource.dart';
import 'package:crypto_list/src/shared/local/json_local_source.dart';

class UserSimulatedDatasource implements UserDatasourceBase {
  @override
  Future<Map> getUser() async {
    final response = await CryptoClientSimulator.fetchUserData();
    final data = jsonDecode(response);

    return data;
  }
}
