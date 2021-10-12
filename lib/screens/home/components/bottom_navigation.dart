import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pos_wappsi/screens/home/components/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.home, Icon(FontAwesomeIcons.home)),
        _buildItem(TabItem.products, Icon(Icons.inventory_2)),
        
        _buildItem(TabItem.clients, Icon(FontAwesomeIcons.peopleArrows)),
        _buildItem(TabItem.cashAccounting, Icon(FontAwesomeIcons.cashRegister)),
      ],
      onTap: (index) {
        onSelectTab(TabItem.values[index]);
        // print(TabItem.values[index]);
        // print(onSelectTab.toString());
      
      } ,
      currentIndex: currentTab.index,
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem, Icon icon) {
    return BottomNavigationBarItem(
      icon:icon,
      label: tabName[tabItem],
      
    );
  }

  // Color _colorTabMatching(TabItem item) {
  //   return currentTab == item ? activeTabColor[item]! : Colors.grey;
  // }
}