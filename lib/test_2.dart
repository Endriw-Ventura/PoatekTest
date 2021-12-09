import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'functions.dart';

class Test2 extends StatefulWidget {
  Test2 ({Key? key}) : super(key: key);

  @override
  _State2 createState() => _State2();
}

class _State2 extends State<Test2> {
  final _controller = TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Two - Functions'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            color: Colors.white,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (val) {
                      text = _controller.text.toString();
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type a word or number to be reversed',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(text == null ? ownReverse(
                        'Type a word or number to be reversed') : ownReverse(
                        text.toString()),
                      style: TextStyle(color: Colors.black.withOpacity(1.0),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
