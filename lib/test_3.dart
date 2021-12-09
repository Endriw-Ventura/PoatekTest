import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poatek_test/fuel_pump.dart';
import 'package:poatek_test/pay_liters_page.dart';

import 'admin_page.dart';
import 'payment_page.dart';

class Test3 extends StatefulWidget {
  Test3 ({Key? key}) : super(key: key);

  @override
  _State3 createState() => _State3();
}

class _State3 extends State<Test3> {
  double price = 0.0;
  FuelPump pump1 = new FuelPump(
      type: fuelType.standard, fuelPrice: 7.75, fuelQuantity: 100.0, number: 1);
  FuelPump pump2 = new FuelPump(
      type: fuelType.alcohol, fuelPrice: 5.50, fuelQuantity: 100.0, number: 2);
  FuelPump pump3 = new FuelPump(
      type: fuelType.premium, fuelPrice: 17.75, fuelQuantity: 100.0, number: 3);
  FuelPump pump4 = new FuelPump(
      type: fuelType.diesel, fuelPrice: 9.20, fuelQuantity: 100.0, number: 4);

  String selectedValue = "1";
  FuelPump? selectedPump = new FuelPump(
      type: fuelType.standard, fuelPrice: 0.0, fuelQuantity: 0.0, number: 0);
  final _valueController = TextEditingController();
  String txtValue = "please, enter a value";
  String amount = "";
  String result = "";
  String fuel = "";
  String type = "";
  final _formKey = GlobalKey<FormState>();
  bool _enableBtn = false;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(pump1.type.toString().substring(9)), value: "1"),
      DropdownMenuItem(
          child: Text(pump2.type.toString().substring(9)), value: "2"),
      DropdownMenuItem(
          child: Text(pump3.type.toString().substring(9)), value: "3"),
      DropdownMenuItem(
          child: Text(pump4.type.toString().substring(9)), value: "4"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Three - Classes'),
      ),
      body: Stack(
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 75,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                        'Fuel type:'
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: DropdownButton(
                        value: selectedValue,
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
                            selectedValue = newValue!;
                            switch (selectedValue) {
                              case "1":
                                selectedPump = pump1;
                                break;
                              case "2":
                                selectedPump = pump2;
                                break;
                              case "3":
                                selectedPump = pump3;
                                break;
                              case "4":
                                selectedPump = pump4;
                                break;
                            }
                          });
                        },
                        items: dropdownItems,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 120,
              child: Text(
                ' Pump Number: ' + selectedPump!.number.toString() +
                    '\n Fuel Type: ' +
                    selectedPump!.type.toString().substring(9) +
                    '\n Price per liter: ' +
                    selectedPump!.fuelPrice.toString() + '\$' +
                    '\n FuelQuantity: ' + selectedPump!.fuelQuantity.toString(),
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              height: 50,
              child:
              Form(
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
                  controller: _valueController,
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
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 75,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(onPressed: _enableBtn ?
                        () {
                      amount = _valueController.text.toString();
                      result = selectedPump!.fillWithPrice(double.parse(amount))
                          .toString();
                      if (double.parse(result) > 0) {
                        selectedPump!.fuelQuantity -= double.parse(result);
                        var aux = selectedPump!.fuelQuantity.toStringAsFixed(2);
                        selectedPump!.fuelQuantity = double.parse(aux);
                      }
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Payment(result: result
                                  .toString(),
                              ),
                        ),
                      );
                    } : null,
                      child: Text(
                          'Fill with price'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120.0),
                    child: ElevatedButton(onPressed: _enableBtn ?
                        () {
                      amount = _valueController.text.toString();
                      result = selectedPump!.fillWithLiters(
                          double.parse(amount)).toString();

                      if (double.parse(result) > 0) {
                        selectedPump!.fuelQuantity -= double.parse(amount);
                      }
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PayLiters(result: result
                                  .toString(),
                              ),
                        ),
                      );
                    } : null,
                      child: Text(
                          'Fill with liters'
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
                  .width,
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              maintainState: true,
                              builder: (context) =>
                                  AdminPage(pump: selectedPump!),
                            ),
                          );
                        },
                        child: Text(
                          'Change Price (Admin Only)',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          ),
        ],
      ),
    );
  }
}