import 'package:flutter/material.dart';

class ChangeSpeedPage extends StatefulWidget {
  static const path = 'ChangeSpeedPage';
  const ChangeSpeedPage({Key? key}) : super(key: key);

  @override
  State<ChangeSpeedPage> createState() => _ChangeSpeedPageState();
}

class _ChangeSpeedPageState extends State<ChangeSpeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Speed Car",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
