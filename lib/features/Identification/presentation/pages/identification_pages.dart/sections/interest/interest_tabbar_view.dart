import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/ui/components/headlines.dart';
import '../../../../../../../core/ui/theme/palette.dart';
import '../../../../../data/models/interest_type.dart';
import '../../../../cubit/interests_cubit.dart';
import 'interest_grid_view.dart';
import '../../../../widgets/decorated_tabbar.dart';

class InterestTabbarView extends StatefulWidget {
  const InterestTabbarView({
    Key? key,
  }) : super(key: key);

  @override
  _InterestTabbarViewState createState() => _InterestTabbarViewState();
}

class _InterestTabbarViewState extends State<InterestTabbarView> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    _tabController.animation?.addListener(() {
      print(_tabController.animation?.value);

      if (_tabController.indexIsChanging) {
        print(_tabController.previousIndex);
        print(_tabController.index);
        context.read<InterestManagerCubit>().changeTab(_tabController.index);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterestManagerCubit, InterestType>(
      builder: (context, state) {
        return Column(
          children: [
            DecoratedTabBar(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.3),
                      width: 2.0,
                    ),
                  ),
                ),
                tabBar: tabBar(context, stateInterestType: state)),
            Expanded(
              child: tabBarView(),
            ),
          ],
        );
      },
    );
  }

  TabBarView tabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        InterestGridView(
          type: InterestType.SPORTS,
        ),
        InterestGridView(
          type: InterestType.ONLINEGAMES,
        ),
        InterestGridView(
          type: InterestType.LANGUAGES,
        ),
        InterestGridView(
          type: InterestType.PETS,
        ),
      ],
    );
  }

  TabBar tabBar(BuildContext context, {required InterestType stateInterestType}) {
    return TabBar(
      indicatorWeight: 2,
      controller: _tabController,
      unselectedLabelColor: Colors.black,
      indicatorColor: Palette.MPINK,
      isScrollable: true,
      tabs: [
        tabItem(context, myInterestType: InterestType.SPORTS, stateInterestType: stateInterestType, title: 'INTERESTS.sports'.tr()),
        tabItem(context, myInterestType: InterestType.ONLINEGAMES, stateInterestType: stateInterestType, title: 'INTERESTS.onlinegames'.tr()),
        tabItem(context, myInterestType: InterestType.LANGUAGES, stateInterestType: stateInterestType, title: 'INTERESTS.languages'.tr()),
        tabItem(context, myInterestType: InterestType.PETS, stateInterestType: stateInterestType, title: 'INTERESTS.pets'.tr()),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

Tab tabItem(BuildContext context, {required String title, required InterestType stateInterestType, required InterestType myInterestType}) => Tab(
      child: Container(
          child: headLineEight(context, title,
              fontWeight: stateInterestType == myInterestType ? FontWeight.w500 : FontWeight.normal,
              color: stateInterestType == myInterestType ? Colors.black : Colors.grey)),
    );
