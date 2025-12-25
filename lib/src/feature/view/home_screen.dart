import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_task/core/constant/padding.dart';
import 'package:interview_task/core/theme/theme_extension/color_scheme.dart';
import 'package:interview_task/src/feature/model/user_model.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../widget/user_tile_widget.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController =
        RefreshController(initialRefresh: false);
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      final homeViewModel = context.read<HomeViewModel>();
      if (homeViewModel.users.isEmpty && !homeViewModel.isLoading) {
        homeViewModel.getUser();
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: context.colorScheme.primary,
        foregroundColor: context.colorScheme.onPrimary,
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: _SearchHeaderDelegate(
                  child: SizedBox(
                    height: 70.h, 
                    child: Padding(
                      padding: AppPadding.screenPadding.copyWith(bottom: 0),
                      child: TextField(
                        controller: homeViewModel.searchController,
                        onChanged: homeViewModel.onSearch,
                        decoration: InputDecoration(
                          hintText: 'Search by name or email',
                          prefixIcon: Icon(
                            Icons.search,
                            color: context.colorScheme.onSurface.withAlpha(150),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],

            body: SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              key: Key('home_screen_refresh_indicator'),
              onRefresh: () async {
                await homeViewModel.getUser();
                refreshController.refreshCompleted();
              },
              header: WaterDropHeader(
                waterDropColor: context.colorScheme.primary,
              ),
              child: ListView.separated(
                padding: AppPadding.screenPadding.copyWith(
                  bottom: 50.h,
                  top: 16.h, 
                ),
                physics: const BouncingScrollPhysics(), 
                itemCount: homeViewModel.isLoading
                    ? 5
                    : homeViewModel.filteredUsers.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final user = homeViewModel.isLoading
                      ? User()
                      : homeViewModel.filteredUsers[index];

                  return Skeletonizer(
                    enabled: homeViewModel.isLoading,
                    child: UserTileWidget(user: user)
                        .animate()
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.1, end: 0.0),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SearchHeaderDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Material(color: context.colorScheme.surface, child: child);
  }

  @override
  double get maxExtent => 70.h;

  @override
  double get minExtent => 70.h;

  @override
  bool shouldRebuild(covariant _SearchHeaderDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
