import 'package:flutter/material.dart';
import 'package:pos_wappsi/screens/Authentication/login_form.dart';
import 'package:pos_wappsi/screens/home/components/tab_item.dart';
import 'package:pos_wappsi/screens/home/home_screen.dart';
import 'package:pos_wappsi/screens/products/products.dart';



class TabNavigatorRoutes {
  static const String root = '/';
  // static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    var routes ;
    if (tabName[tabItem]=='Inicio'){
       routes = {
          TabNavigatorRoutes.root    : (context) => HomeScreen(),
          'loginForm'    : (context) => LoginForm(),
       };
    }else{
      routes = {
          TabNavigatorRoutes.root    : (context) => Products(),
       };
    }
    return routes;
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}