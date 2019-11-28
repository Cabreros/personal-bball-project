import 'package:flutter/material.dart';

class SubPage extends StatefulWidget {
  final dynamic text;
  @override
  _SubPageState createState() => _SubPageState();

  SubPage({this.text});
}

class _SubPageState extends State<SubPage> {
  SubPage text = new SubPage();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/OGanunoby.png'),
            Text(
              widget.text['FullName'],
              style: TextStyle(fontSize: 50),
            )
          ],
        ),
      ),
    );
  }
}
