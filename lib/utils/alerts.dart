import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';

void simpleAlert(BuildContext context, String msj) {
  showConfirmDialogCustom(
    context,
    title: msj,
    // negativeText: 'Cancelar',
    positiveText: 'Aceptar',
    onAccept: (_) {},
  );
}

choiceAlert(BuildContext context, String msj, String img) async {
  final size = MediaQuery.of(context).size;

  final result = await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              img,
              height: size.height * 0.15,
            ),
          ),
          content: Text(
            msj,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          actions: <Widget>[
            Container(
              color: Colors.redAccent,
              child: CupertinoDialogAction(
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              child: CupertinoDialogAction(
                child: Text(
                  'Aceptar',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ),
          ],
        );
      });
  return result;
}

choiceAlertAndroid(
  BuildContext context,
  String msj,
) async {
  // final size = MediaQuery.of(context).size;

  bool result = false;

  await showConfirmDialogCustom(context,
      title: msj,
      negativeText: 'Cancelar',
      positiveText: 'Aceptar', onAccept: (_) {
    result = true;
  }, onCancel: (_) {});

  return result;
}

void loading(BuildContext context, {String img: 'assets/images/loading.gif'}) {
  final size = MediaQuery.of(context).size;
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
            title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            img,
            height: size.height * 0.15,
          ),
        ));
      });
}

// void showConfirmationDeleteAlert(BuildContext context, String msj, String id) {
//   final size = MediaQuery.of(context).size;
//   showCupertinoDialog(
//       context: context,
//       builder: (context) {
//         return CupertinoAlertDialog(
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SvgPicture.asset(
//                 "assets/icons/remove.svg",
//                 height: size.height * 0.15,
//               ),
//           ),
//           content: Text(
//             msj,
//             textAlign: TextAlign.center,
//           ),
//           actions: <Widget>[
//             CupertinoDialogAction(
              
//               child: Text(
//                 'Yes',
//                 style: TextStyle(color: Colors.black87),
//                 textAlign: TextAlign.center,
//               ),
                
//               onPressed: () async{
//                 try {
//                   loading(context);
//                   Map res = await deleteRecord(id);
//                   if(res['status']){
//                     Navigator.of(context).pop();
//                     Navigator.of(context).pop();
//                     simpleAlert(context, 'Record deleted!','assets/icons/checked.svg');
//                   }else{
//                     Navigator.of(context).pop();
//                     Navigator.of(context).pop();
//                     simpleAlert(context, res['msg'],'assets/icons/error.svg');
//                   }
//                 } catch (e) {
//                   // must manage errors
//                 }
//               },
//             ),
//             CupertinoDialogAction(
//               child: Text(
//                 'No',
//                 style: TextStyle(color: Colors.black87),
//                 textAlign: TextAlign.center,
//               ),
                
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//           ],
//         );
//       });
// }