import 'package:flutter/material.dart';
import 'package:pos_wappsi/screens/home/components/bottom_navigation.dart';
import 'package:pos_wappsi/screens/home/components/tab_item.dart';
import 'package:pos_wappsi/screens/home/components/tab_navigator.dart';
import 'package:pos_wappsi/utils/alerts.dart';
import 'package:restart_app/restart_app.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currentTab = TabItem.home;
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.products: GlobalKey<NavigatorState>(),
    TabItem.cashAccounting: GlobalKey<NavigatorState>(),
    TabItem.clients: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    // print(tabItem);
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool _close = false;

        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(TabItem.home);
            // back button handled by app
            _close = false;
          } else {
            _close = await choiceAlertAndroid(context, '¿Desea cerrar sesión?');
          }
        }

        if (_close) {
          // with this we restart application
          Restart.restartApp(webOrigin: 'loginForm');
        }

        return _close;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.products),
          _buildOffstageNavigator(TabItem.clients),
          _buildOffstageNavigator(TabItem.cashAccounting),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   elevation: 6.0,
        //   selectedItemColor: kMainColor,
        //   // ignore: prefer_const_literals_to_create_immutables
        //   items: [
        //     const BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     const BottomNavigationBarItem(
        //       icon: Icon(Icons.flare_sharp),
        //       label: 'Maan',
        //     ),
        //     const BottomNavigationBarItem(
        //       icon: Icon(Icons.backpack),
        //       label: 'Package',
        //     ),
        //     const BottomNavigationBarItem(
        //         icon: Icon(Icons.settings), label: 'Settings'),
        //   ],
        //   currentIndex: _selectedIndex,
        //   onTap: _onItemTapped,
        // ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    // print(tabItem);
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
