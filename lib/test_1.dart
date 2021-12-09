import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'result.dart';

class Test1 extends StatefulWidget {
  Test1 ({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Test1> {
  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _heightcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';
  String height = '';
  String result = '';
  String txtName = 'Name';
  String txtAge = 'Age';
  String txtHeight = 'Height';
  bool _enableBtn = false;
  List<dynamic> list = [];
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Test One - Lists'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 2,
              child: Form(
                key: _formKey,
                onChanged: () =>
                    setState(() =>
                    _enableBtn = _formKey.currentState!.validate()),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              txtName = 'Please enter a Name';
                              return txtName;
                            }
                          },
                          controller: _namecontroller,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: txtName,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              txtAge = 'Please enter a Age';
                              return txtAge;
                            }
                          },
                          controller: _agecontroller,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]{0,2}'),
                            ),
                          ],
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: txtAge,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              txtHeight = 'Please enter a Height';
                              return txtHeight;
                            }
                          },
                          controller: _heightcontroller,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]{0,3}'),
                            ),
                          ],
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: txtHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 50,
                                    width: 175,
                                    color: Colors.blue,
                                    child: ElevatedButton(
                                      onPressed: _enableBtn ? () {
                                        name = _namecontroller.text.toString();
                                        age = _agecontroller.text.toString();
                                        height =
                                            _heightcontroller.text.toString();
                                        list.add({
                                          'name': name,
                                          'age': age,
                                          'height': height
                                        });
                                        count++;
                                        _formKey.currentState?.save();
                                        _formKey.currentState?.reset();
                                        _namecontroller.clear();
                                        _agecontroller.clear();
                                        _heightcontroller.clear();
                                        if (count > 9) {
                                          count = 0;
                                          result = getAverage(list).toString();
                                          list.clear();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Result(result: result
                                                      .toString(),
                                                  ),
                                            ),
                                          );
                                        }
                                      } : null,
                                      child: Text('Submit'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}



int getAverage(List<dynamic> list) {
  List<int> ages = [];
  int sum = 0;
  double average = 0;

  list.forEach((element) { //calculate average
    int valor = int.parse(element["height"]);
    sum += valor;
  });

  average = sum / 10;

  list.forEach((element) { //get all over 13 yo and under average
    int age = int.parse(element["age"]);
    int height = int.parse(element["height"]);
    if (age > 13 && height <= average) {
      ages.add(age);
    }
  });

  return ages.length;
}