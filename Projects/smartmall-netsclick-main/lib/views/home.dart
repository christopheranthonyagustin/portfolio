import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../models/bank_card.dart';
import 'payment.dart';
import 'register.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BankCard? netsBandCard;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  getCard() async {
    await SharedPreferences.getInstance().then((pref) {
      String? card = pref.getString('registered_card');
      if (card != null) {
        netsBandCard = BankCard.fromJson(jsonDecode(card));
      } else {
        netsBandCard = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getCard();
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/nets_click.png', width: 450, fit: BoxFit.cover),
            Text('NETS CLICK', style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Register / Deregister', style: TextStyle(color: Colors.white, fontSize: 24)),//Theme.of(context).textTheme.titleLarge
              onPressed: () => //print('go to manage payment page'),
              Navigator.push(context, MaterialPageRoute(builder: (context) => ManagePayment(card: netsBandCard,)))),
            ElevatedButton(
              child: const Text('Make Payment', style:TextStyle(color: Colors.white, fontSize: 24)),
              onPressed: () => //print('go to purchase page'),
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MakePayment()))),
            const SizedBox(height: 30),

          ],
        )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Menu',
        child: const Icon(Icons.refresh),
      ));
  }
}
