import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final message;

  const MessageDisplay({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 3 / 7,
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              message,
              style: TextStyle(fontSize: 25, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
