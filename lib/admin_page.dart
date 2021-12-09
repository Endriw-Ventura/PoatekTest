import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poatek_test/fuel_pump.dart';

import 'functions.dart';

class AdminPage extends StatefulWidget {
  final FuelPump pump;
  const AdminPage({Key? key, required this.pump }) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState(pump: pump);
}

class _AdminPageState extends State<AdminPage> {
  final FuelPump pump;
  String selected = "1";
  final _formKey = GlobalKey<FormState>();

  _AdminPageState({required this.pump});

  final _priceController = TextEditingController();
  String txtValue = "please, enter a value";
  String price = "";
  bool _enableBtn = false;

  List<DropdownMenuItem<String>> get dropdownItemsAux {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Standard"), value: "1"),
      DropdownMenuItem(child: Text("Alcohol"), value: "2"),
      DropdownMenuItem(child: Text("Premium"), value: "3"),
      DropdownMenuItem(child: Text("Diesel"), value: "4"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Three - Classes - Admin Page',
        ),
      ),
      body: Stack(
        children: <Widget>[Column(
          children: [
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 100,
              child:
              Row(
                children: [
                  Text('Select the new type of fuel: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: DropdownButton(
                      value: selected,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selected = newValue!;
                        });
                      },
                      items: dropdownItemsAux,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 100,
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 100,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      child: Form(
                        key: _formKey,
                        onChanged: () =>
                            setState(() =>
                            _enableBtn = _formKey.currentState!.validate()),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              txtValue = 'Enter a valid value';
                              return txtValue;
                            }
                          },
                          controller: _priceController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^[0-9]{0,3}[.]{0,1}[0-9]{0,2}'),
                            ),
                          ],
                          keyboardType: TextInputType.number,
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: txtValue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 4,
              height: 50,
              child: ElevatedButton(onPressed: _enableBtn ?
                  () {
                price = _priceController.text.toString();
                double val = double.parse(price);
                setPrice(selected, val, pump);
                Navigator.pop(context, pump);
              } : null,
                child: Text(
                    'Submit'
                ),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
