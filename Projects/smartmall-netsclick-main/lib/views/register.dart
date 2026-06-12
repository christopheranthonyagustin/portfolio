import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import 'helper.dart';
import 'home.dart';
import 'widgets/bank_card_details.dart';
import 'widgets/payment_item.dart';

import '../constants.dart';
import '../service/api/api_service.dart';
import '../service/method_channel_nof_service.dart';
import '../models/bank_card.dart';

class ManagePayment extends StatefulWidget {
  BankCard? card;
  ManagePayment({Key? key, this.card}) : super(key: key);

  @override
  ManagePaymentState createState() {
    return ManagePaymentState();
  }
}

class ManagePaymentState extends State<ManagePayment> {
  BankCard? netSClickCard;
  @override
  void initState() {
    netSClickCard = widget.card;
    super.initState();
  }

  _renderAddNetsCard(BuildContext context) {
    return PaymentItem(
        title: 'NETS Bank Card',
        subTitle: 'Add NETS Bank Card',
        image: Image.asset('assets/img/nets_logo.png', width: 50, fit: BoxFit.cover),
        onTapped: () async => callNetsSDKWebView()
      // BlocProvider.of<ManagePaymentBloc>(context).add(
      // CallRegistrationNetsClick(fcMids1, AuthenticationProvider.of(context).getFCAuthBase!.accountId))
    );
  }

  Widget _renderExistingCards(BuildContext context, BankCard card) {
    return PaymentItem(
        title: '${card.getDisplayType()} - XX${card.lastFourDigit}',
        image: card.getDisplayImage(width: 50),
        onTapped: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) => BankCardDetails(bankCard: card))));
  }

  callNetsSDKWebView() async {
    startLoading(context, 'calling NETS WebView...');
    await doRegistration(Mid, Muid).then((tlv) {
      // Check for error code.
      if (checkIsRegistrationErrorCode(tlv) != null) {
        throw checkIsRegistrationErrorCode(tlv)!;
      }
      print('callNetsSDKWebView success');
      if (tlv.contains('FAILED')){
        if (tlv.contains('3000')) tlv += ' Please use a physical android phone';
        Navigator.of(context).pop();
        showSimpleDialog(title: 'Unable to call NETS Click SDK', message: tlv, context: context);
      } else{
        Navigator.of(context).pop();
        registerNETSCard(tlv);
      }
    }).onError((error, stackTrace) {
      print('callNetsSDKWebView error: $error');
      Navigator.of(context).pop();
      showSimpleDialog(title: 'Unable to call NETS Click SDK', message: error.toString(), context: context);
    });
  }

  registerNETSCard(String tlv) async {
    print('TLV: $tlv');
    startLoading(context, 'Registering Card with Merchant...');
    await BeveatAPIService().registerTokenNetsClick(tlv, OrgId).then((bankCard) async {
      if (bankCard == null) {
        throw 'No bank details return!';
      } else {
        Navigator.of(context).pop();
        print(bankCard);
        setState() => netSClickCard = bankCard;
        var sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString('registered_card', jsonEncode(bankCard));
        showSimpleDialog(title: 'Successfully registered NETS Card', message: 'Last 4 digit ${bankCard.lastFourDigit} card has successfully registered, you may now proceed to do payment', context: context,
            onDismissed: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'NETS Click Flutter Function Demo'))));

      // existingPaymentBloc.add(AddExistingPayment(bankCard));
      }
    }).onError((error, stackTrace) {
      print('registerNETSCard error: $error');
      Navigator.of(context).pop();
      showSimpleDialog(title: 'Unable to register card via Merchant Host', message: error.toString(), context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manage Payment')),
        body: ListView(children: [
          // const ManagePaymentManager(),
        Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (netSClickCard == null)
                const Text('AVAILABLE PAYMENT METHODS',style: TextStyle(fontSize: 12,color: Colors.black54,fontWeight: FontWeight.w600)),
              if (netSClickCard == null)
                _renderAddNetsCard(context),
              if (netSClickCard != null)
                const Text('EXISTING PAYMENTS',style: TextStyle(fontSize: 12,color: Colors.black54,fontWeight: FontWeight.w600)),
              if (netSClickCard != null)
                _renderExistingCards(context, netSClickCard!)
            ]))
        ]));
  }
}
