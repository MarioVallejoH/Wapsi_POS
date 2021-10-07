import 'package:flutter/material.dart';
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
        _buildItem(TabItem.home, Icon(Icons.home)),
        _buildItem(TabItem.products, Icon(Icons.inventory_2)),
        
        _buildItem(TabItem.clients, Icon(Icons.people_outline_outlined)),
        _buildItem(TabItem.cashAccounting, Icon(Icons.monetization_on)),
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