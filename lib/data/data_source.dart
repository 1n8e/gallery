import 'package:dio/dio.dart';
import 'package:test_project/model/asset_model.dart';

class DataSource {
  final Dio dio;
  final AssetModel asset;

  DataSource(this.dio, this.asset);

  Future<List> getData(int page) => dio.get('', queryParameters: {
        'per_page': 10,
        'page': page,
      }).then((value) => value.data);
}
