import 'package:test_project/data/data_source.dart';
import 'package:test_project/model/asset_model.dart';

class AssetsRepository {
  final DataSource dataSource;
  final AssetModel asset;

  AssetsRepository(this.dataSource, this.asset);

  Future<List<AssetModel>> getData(int page) async {
    return await dataSource.getData(page).then(
        (value) => (value).map((e) => AssetModel.fromJson(e)).toList());
  }
}
