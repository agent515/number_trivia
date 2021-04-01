import 'package:flutter/material.dart';

class TriviaWidget extends StatelessWidget {
  final trivia;
  const TriviaWidget({
    Key key,
    @required this.trivia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 3 / 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              trivia.number.toString(),
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 50),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  trivia.text,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ));
  }
}
