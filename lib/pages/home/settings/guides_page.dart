import 'package:flutter/material.dart';

class GuidesPage extends StatefulWidget {
  static const path = "GuidesPage";
  const GuidesPage({Key? key}) : super(key: key);

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Guides to connect Arduino",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
