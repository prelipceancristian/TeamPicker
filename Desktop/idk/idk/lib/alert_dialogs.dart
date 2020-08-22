import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK", style: TextStyle(color: Colors.red[700], fontSize: 16.0)),
    onPressed: () {
      Navigator.pop(context);
    },
    //padding: EdgeInsets.only(top:50.0)
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Hold up there, bud!",
        textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "A Dota 2 team has only five heroes. ",
          style: TextStyle(fontSize: 18.0),
        ),
        okButton
      ],
    ),
    elevation: 24.0,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: true,
  );
}

showAlertDialogWK(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("No, take me back...",
        style: TextStyle(
            color: Colors.white, fontSize: 16.0, fontStyle: FontStyle.italic)),
    onPressed: () {
      Navigator.pop(context);
    },
    //padding: EdgeInsets.only(top:50.0)
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "YOU DARE TOUCH THE SKELETON KING, MORTAL?",
      textAlign: TextAlign.center,
    ),
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset("assets/hero_icons/Skeleton_King_Art.jpg"),
        okButton
      ],
    ),
    elevation: 24.0,
    backgroundColor: Colors.red[900],
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: true,
  );
}
