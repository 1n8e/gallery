import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:test_project/bloc/asset_cubit/asset_cubit.dart';
import 'package:test_project/model/asset_model.dart';
import 'package:test_project/ui/gallery_screen/gallery_card.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(scrollListen);
    super.initState();
  }

  void scrollListen() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        context.read<AssetCubit>().getAssets();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AssetCubit, AssetState>(
      builder: (context, state) {
        if (state is AssetLoadingState && state.isFirstFetched) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        }

        List<AssetModel> assets = [];
        if (state is AssetLoadingState) {
          assets = state.loadedAssets;
        }
        if (state is AssetLoadedState) {
          assets = state.assets;
        }
        return MasonryGridView.count(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          itemCount: assets.length,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 2,
          itemBuilder: (context, index) {
            return AssetCard(
              username: assets[index].username,
              thumb: assets[index].thumb,
              description: assets[index].description,
              full: assets[index].full,
            );
          },
        );
      },
    );
  }
}
