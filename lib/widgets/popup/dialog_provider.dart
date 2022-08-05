import 'package:flutter/material.dart';

class DialogProvider {
  static void showErrorDialog(
      BuildContext context, String content, Function() onPressOk,
      {String? title}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title ?? ""),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  onPressOk.call();
                },
              )
            ],
          );
        });
  }

  static void showDialogNormal(String message, BuildContext context,
      String? buttonLeft, String? buttonRight, Function() onPressOk,
      [String? title]) async {
    var titleWidget = (title == null || title.isEmpty) ? null : Text(title);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: titleWidget,
          content: Text(message),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            TextButton(
              child: Text(buttonLeft ?? "Huỷ"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(buttonRight ?? "Tiếp tục"),
              onPressed: () {
                Navigator.pop(context);
                onPressOk.call();
              },
            )
          ],
        );
      },
    );
  }
}
