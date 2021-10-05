class GridItems {
  final String title, icon, route;

  GridItems({required this.title, required this.icon, required this.route});
}

List<GridItems> freeIcons = [
  GridItems(
    title: 'Nueva venta',
    route: "newSale",
    icon: 'assets/images/cart.png',

  ),

  // GridItems(
  //   title: 'Lista de ventas',
  //   icon: 'assets/images/salelist.png',
  // ),

  GridItems(
    title: 'Cotizar',
    route: "",
    icon: 'assets/images/calculator.png',

  ),
  
  
  GridItems(
    title: 'Clientes',
    route: "",
    icon: 'assets/images/customer.png',

  ),
  GridItems(
    title: 'Inventario',
    route: "stock",
    icon: 'assets/images/stock.png',
  ),
  GridItems(
    title: 'Reportes',
    route: "",
    icon: 'assets/images/reports.png',

  ),
  
  GridItems(
    title: 'Entregas',
    route: "",
    icon: 'assets/images/delivery.png',

  ),
];

// List<GridItems> businessIcons = [
  

  

//   GridItems(
//     title: 'Dashboard',
//     icon: 'assets/images/dashboard.png',

//   ),
// ];

// List<GridItems> enterpriseIcons = [
//   // GridItems(
//   //   title: 'Branch',
//   //   icon: 'assets/images/branch.png',

//   // ),
//   // GridItems(
//   //   title: 'Damage',
//   //   icon: 'assets/images/damage.png',

//   // ),
//   // GridItems(
//   //   title: 'Adjustment',
//   //   icon: 'assets/images/adjustment.png',

//   // ),
//   GridItems(
//     title: 'Transaction',
//     icon: 'assets/images/transaction.png',

//   ),
 
//   GridItems(
//     title: 'Loss&Profit',
//     icon: 'assets/images/lossProfit.png',
//   ),
//   GridItems(
//     title: 'Backup',
//     icon: 'assets/images/backup.png',
//   ),
// ];