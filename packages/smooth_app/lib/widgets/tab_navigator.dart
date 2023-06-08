import 'package:flutter/material.dart';
import 'package:smooth_app/pages/eds_api/record_page.dart';
import 'package:smooth_app/pages/history_page.dart';
import 'package:smooth_app/pages/page_manager.dart';
import 'package:smooth_app/pages/preferences/user_preferences_page.dart';
import 'package:smooth_app/pages/scan/scan_page.dart';

class TabNavigator extends StatelessWidget {
  const TabNavigator({
    required this.navigatorKey,
    required this.tabItem,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final BottomNavigationTab tabItem;

  @override
  Widget build(BuildContext context) {
    final Widget child;

    switch (tabItem) {
      case BottomNavigationTab.Profile:
        child = const UserPreferencesPage();
        break;
      case BottomNavigationTab.History:
        child = const HistoryPage();
        break;
      case BottomNavigationTab.Scan:
        child = const ScanPage();
        break;
      case BottomNavigationTab.Record:
        child = const RecordPage();
        break;
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => child,
        );
      },
    );
  }
}
