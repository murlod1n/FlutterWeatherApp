import 'package:flutter/material.dart';
import 'forecast_tab.dart';
import 'today_tab.dart';

class NestedTabBar extends StatefulWidget {
  NestedTabBar({super.key});

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          children: <Widget>[
            TabBar.secondary(
              padding: const EdgeInsets.only(left: 80, right: 80),
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              labelColor: Colors.white,
              splashFactory: NoSplash.splashFactory,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: const <Widget>[
                Tab(text: 'Today'),
                Tab(text: 'After'),
              ],
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: <Widget>[
                const TodayTab(),
                const ForecastTab()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
