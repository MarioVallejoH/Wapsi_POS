import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtonGlobal extends StatelessWidget {
  var iconWidget;
  final String buttontext;
  final Decoration buttonDecoration;
  var onPressed;

  ButtonGlobal({
    required this.iconWidget,
    required this.buttontext,
    required this.buttonDecoration,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: buttonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttontext,
              style: GoogleFonts.jost(
                fontSize: 20.0, 
                color: Theme.of(context).primaryTextTheme.button!.color,
              ),
            ),
            Icon(
              iconWidget,
              color: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}
// ignore: must_be_immutable
class ButtonGlobalWithoutIcon extends StatelessWidget {
  final String buttontext;
  final Decoration buttonDecoration;
  var onPressed;

  ButtonGlobalWithoutIcon({
    required this.buttontext,
    required this.buttonDecoration,
    required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: buttonDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttontext,
              style: GoogleFonts.jost(
                fontSize: 20.0, 
                color: Theme.of(context).primaryTextTheme.button!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
