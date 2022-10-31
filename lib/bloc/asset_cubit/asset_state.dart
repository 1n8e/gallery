part of 'asset_cubit.dart';

abstract class AssetState {}

class AssetInitial extends AssetState {}

class AssetLoadingState extends AssetState {
  final List<AssetModel> loadedAssets;
  final bool isFirstFetched;

  AssetLoadingState(this.loadedAssets, {this.isFirstFetched = false});
}

class AssetLoadedState extends AssetState {
  final List<AssetModel> assets;

  AssetLoadedState(this.assets);
}

class AssetFailureState extends AssetState {
  final String error;

  AssetFailureState(this.error);
}
