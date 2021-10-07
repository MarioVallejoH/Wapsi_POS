import 'package:flutter/material.dart';
import 'package:pos_wappsi/screens/home/home_screen.dart';
import 'package:pos_wappsi/screens/products/products.dart';

enum TabItem { home, products, clients, cashAccounting }

const Map<TabItem, String> tabName = {

  TabItem.home           : 'Inicio',
  TabItem.products       : 'Productos',
  TabItem.clients        : 'clientes',
  TabItem.cashAccounting : 'Caja'

};

const Map<TabItem, String> tabTag = {

  TabItem.home           : 'home',
  TabItem.products       : 'products',
  TabItem.clients        : 'clients',
  TabItem.cashAccounting : 'cashAccounting'

};

const Map<TabItem, Widget> activeTabWidget = {
 
  TabItem.home           : HomeScreen(),
  TabItem.products       : Products(), 
  TabItem.clients        : HomeScreen(), 
  TabItem.cashAccounting : HomeScreen()


};

