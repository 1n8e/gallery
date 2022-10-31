import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/asset_cubit/asset_cubit.dart';
import 'package:test_project/core/injections.dart';
import 'package:test_project/ui/gallery_screen/gallery_screen.dart';
import 'package:test_project/ui/profile_screen/profile_screen.dart';
import 'package:test_project/widgets/settings_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AssetCubit>(
      create: (_) => getIt<AssetCubit>()..getAssets(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  title: Text('Chebupeli', style: Theme.of(context).textTheme.titleLarge,),
                  centerTitle: true,
                  backgroundColor: Theme.of(context).bottomAppBarColor,
                  actions: const [
                    SettingsButton()
                  ],
                  bottom: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 4,
                    controller: tabController,
                    labelStyle: Theme.of(context).textTheme.titleSmall,
                    tabs: [
                      Tab(
                        child: Text('Gallery', style: Theme.of(context).textTheme.titleSmall,),
                      ),
                      Tab(
                        child: Text('Profile', style: Theme.of(context).textTheme.titleSmall,),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: tabController,
              children: const [
                GalleryScreen(),
                ProfileScreen(),
              ],
            )),
      ),
    );
  }
}
