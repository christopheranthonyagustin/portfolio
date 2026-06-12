import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../constants.dart';
import '../service/api/api_service.dart';
import '../service/method_channel_nof_service.dart';
import '../models/bank_card.dart';
import '../models/nets_click_payload.dart';
import 'helper.dart';

class MakePayment extends StatefulWidget {
  const MakePayment({Key? key}) : super(key: key);

  @override
  MakePaymentState createState() {
    return MakePaymentState();
  }
}

class MakePaymentState extends State<MakePayment> {
  TextEditingController consumerController = TextEditingController();
  TextEditingController merchantController = TextEditingController();
  TextEditingController orderIdController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  BankCard? netSClickCard;
  @override
  void initState() {
    consumerController.text = Muid;
    merchantController.text = MerchantId;
    super.initState();
  }

  List<Widget>_renderTrx(){
    return [];
  }

  callNETSDebit(double amount,String consumerId, String orderId, String merchantId, BuildContext firstContext) async {
    startLoading(firstContext, 'calling NETS Debit function...');
    BankCard? card;
    await SharedPreferences.getInstance().then((pref) => card  = pref.getString('registered_card') !=  null ? BankCard.fromJson(jsonDecode(pref.getString('registered_card')!)): null);
    if (card == null){
      print('NETS CARD HAS NOT BEEN REGISTERED YET');
      Navigator.of(firstContext).pop();
      showSimpleDialog(title: 'NETS Click not found', message: "You have not register your NETS Click Card yet!", context: firstContext);
    } else {
      await doDebit(amount).then((tlv) async {
        Navigator.of(firstContext).pop();
        //TODO: set NETSClickPayload
        // consumerId: ,
        // orderId: ,
        // merchantId: ,
        // tlv: ,
        // amount: ,
        // netClickId: Bank Card ID during registration
        NETSClickPayload netsPayload =  NETSClickPayload(consumerId: consumerId, orderId: orderId, merchantId: merchantId, tlv: tlv, amount: amount, netClickId: card!.id);
        if (tlv.contains('BlueboxMasterKeyExploit')) {
          showSimpleDialog(title: 'Error: 9991', message: tlv, context: context);
        } else {
          print('callNETSDebit success $tlv');
          startLoading(firstContext, 'NETS Successfully received \$${amount.toStringAsFixed(2)} payment!\ncalling Merchant Host...');
          await payMerchant(netsPayload, firstContext);
        }

      }).onError((error, stackTrace) {
        print('callNETSDebit error: $error');
        Navigator.of(firstContext).pop();
        showSimpleDialog(title: 'Unable to call made payment to NETS', message: error.toString(), context: firstContext);
      });
    }
  }

  payMerchant(NETSClickPayload payload, BuildContext lastContext) async {
    await BeveatAPIService().confirmPurchaseNetsClick(payload).then((status) async {
      Navigator.of(lastContext).pop();
      String responseCode = status.substring(0, 2);

      if (status == 'success') {
        // Success with 00.
        HapticFeedback.vibrate();
        showSimpleDialog(title: 'Success!', message:'Successfully made \$${payload.amount.toStringAsFixed(2)} to merchant', context: lastContext);

      } else if ((responseCode == '55' || responseCode == 'U9') &&
          ('53100${status.substring(48, status.length - 2)}').length == 105) {
        // Require PIN.
        print('user require to key in pin');
        await doDebitWithPin(payload.amount, responseCode, '53100${status.substring(48, status.length - 2)}').then((tlv) => {
            payload.changeTLV(tlv),
            payMerchant(payload, lastContext)
          });
      } else {
        showSimpleDialog(title: 'Error', message:'There is some error with your NETS account!', context: lastContext);
      }
    }).onError((error, stackTrace) {
      Navigator.of(lastContext).pop();
      print('payMerchant error: $error');
      showSimpleDialog(title: 'Error', message:'$error', context: lastContext);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Manage Payment')),
        body: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: 200,
                  child:TextField(
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Consumer / Account Id',
                          hintText: 'Insert Account Id of Consumer'
                      ),
                      controller: consumerController)),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: 200,
                  child:TextField(
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Merchant Id',
                          hintText: 'Insert Merchant Id of Merchant'
                      ),
                      controller: merchantController)),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: 200,
                  child:TextField(
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Order Id',
                          hintText: 'Insert random unique order Id'
                      ),
                      controller: orderIdController,
                      keyboardType: TextInputType.number)),

               Row(children: [
                 Container(
                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                     width: 300,
                     child:TextField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.attach_money),
                          border: UnderlineInputBorder(),
                          labelText: 'Make Payment',
                          hintText: 'Enter Any Amount'
                      ),
                         controller: amountController,
                         keyboardType: TextInputType.number)),
                  IconButton(
                      onPressed: () async {
                        if (consumerController.text.isNotEmpty && merchantController.text.isNotEmpty && orderIdController.text.isNotEmpty && amountController.text.isNotEmpty) {
                          callNETSDebit(double.parse(amountController.text), consumerController.text, orderIdController.text, merchantController.text, context);
                        } else {
                          showSimpleDialog(title: 'Empty Text Field', message: 'Please key in values to the respective fields', context: context);
                        }
                      }, icon: const Icon(Icons.arrow_circle_right, size: 30))
               ],
               ),
               // const ManagePaymentManager(),
              // const Divider(thickness: 2, height:20, color: Colors.red),
              // Padding(
              // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              // child: SingleChildScrollView(
              //   child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text('Past Transactions', style: TextStyle(fontSize: 20,color: Colors.black54,fontWeight: FontWeight.w600)),
              //         if (_renderTrx().isEmpty)
              //           const Center(
              //               child: Padding(padding: EdgeInsets.only(top: 100),
              //                   child: Text('No Transactions has been made',style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.w600)))),
              //         ..._renderTrx()
              //       ])))
        ]));
  }
}
