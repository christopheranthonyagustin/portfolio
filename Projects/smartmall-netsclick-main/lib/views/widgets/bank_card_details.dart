import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/bank_card.dart';
import '../../service/method_channel_nof_service.dart';
import '../helper.dart';
import '../home.dart';
import 'bank_card_item.dart';

class BankCardDetails extends StatefulWidget {
  final BankCard bankCard;

  const BankCardDetails({Key? key, required this.bankCard}) : super(key: key);

  @override
  BankCardDetailsState createState() {
    return BankCardDetailsState();
  }
}

class BankCardDetailsState extends State<BankCardDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Bank Card Detail'),),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BankCardItem(
                title: widget.bankCard.getDisplayType(),
                subTitle:
                '${widget.bankCard.getDisplayBankName()} - XX ${widget.bankCard.lastFourDigit}',
                subTitle2: 'Expires ${widget.bankCard.expiry}',
                image: widget.bankCard.getDisplayImage(width: 50),
                onTapped: () => {
                  showYesNoDialog(
                      title: 'Delete Card',
                      message: 'Are you sure you want to delete card?',
                      onYesTapped: () async {
                        startLoading(context, 'doing Deregistration...');
                        await doDeregistration().then((value) async {
                          Navigator.of(context).pop();
                          Navigator.pop(context, false);
                          await SharedPreferences.getInstance().then((pref) => pref.clear());
                          showSimpleDialog(title: 'Successful Deregistration', message: 'Response code: $value', context: context,
                              onDismissed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'NETS Click Flutter Function Demo'))));
                        }
                        ).onError((error, stackTrace) {
                          Navigator.of(context).pop();
                          showSimpleDialog(title: 'Unable to do Deregistration', message: error.toString(), context: context);
                        }
                        );
                      },
                      context: context)
                },
              ),
            ]));
  }
}
