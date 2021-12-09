

import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String result;
  const Result({Key? key, required this.result}) : super(key: key);
  @override
  _ResultState createState() => _ResultState(result: result);
}

class _ResultState extends State<Result> {
  final String result;
  _ResultState({required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('PoaTek Test 1 - Result'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your class have $result students \n   under the average height',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
