
import 'package:flutter/material.dart';

class PayLiters extends StatefulWidget {
  final String result;
  const PayLiters({Key? key, required this.result}) : super(key: key);
  @override
  _PayLitersState createState() => _PayLitersState(result: result);
}

class _PayLitersState extends State<PayLiters> {
  final String result;

  _PayLitersState({required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PoaTek Test 3 - Classes'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery
              .of(context)
              .size
              .height,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'The price to pay is $result',
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