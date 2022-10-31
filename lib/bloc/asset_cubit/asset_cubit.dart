import 'package:bloc/bloc.dart';
import 'package:test_project/model/asset_model.dart';
import 'package:test_project/repository/assets_repository.dart';

part 'asset_state.dart';

class AssetCubit extends Cubit<AssetState> {
  final AssetsRepository repository;
  int page = 1;

  AssetCubit(this.repository) : super(AssetInitial());

  void getAssets()  {
    if (state is AssetLoadingState) return;
    List<AssetModel> loadedAssets = [];
    final currentState = state;
    if (currentState is AssetLoadedState) {
      loadedAssets = currentState.assets;
    }

    emit(AssetLoadingState(loadedAssets, isFirstFetched: page == 1));
    repository.getData(page).then((newAssets) {
      page++;
      final assets = (state as AssetLoadingState).loadedAssets;
      assets.addAll(newAssets);
      emit(AssetLoadedState(assets));
    });
  }
}
