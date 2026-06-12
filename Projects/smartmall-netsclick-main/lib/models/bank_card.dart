import 'package:flutter/material.dart';

class BankCard {
  final int id;
  final String type;
  final String paymentMode;
  final String lastFourDigit;
  final String expiry;
  bool isDefault;

  BankCard(
      {required this.id,
      required this.type,
      required this.paymentMode,
      required this.lastFourDigit,
      required this.expiry,
      this.isDefault = false});

  List<Object> get props => [type, lastFourDigit, expiry];

  String getDisplayBankName() {
    return type.trim();
    // return 'Nets';
    // if (paymentMode == 'nets_click') {
    //   return 'NETS';
    // } else {
    //   return 'DBS';
    // }
  }

  String getDisplayType() {
    // return 'Nets Card';
    if (paymentMode == 'nets_click') {
      return 'NETS Bank Card';
    } else {
      return 'Credit Card';
    }
  }


  Widget getDisplayImage({double width = 50, double height = -1}) {
    // return Image.asset(
    //   'assets/images/nets_logo.png',
    //   width: width,
    //   height: height == -1 ? null : height,
    // );
    if (paymentMode == 'nets_click') {
      return Image.asset(
        'assets/img/nets_logo.png',
        width: width,
        height: height == -1 ? null : height,
      );
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: Icon(
          Icons.credit_card,
          size: 38,
        ),
      );
    }
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['payment_mode'] = paymentMode;
    data['last_four_digit'] = lastFourDigit;
    data['expiry'] = expiry;
    data['is_default'] = isDefault;
    return data;
  }

  static fromJson(Map<String, dynamic> json) {
    print(json);
    return BankCard(
        id: json['id'] as int,
        type: json['type'] as String,
        paymentMode: json['payment_mode'] as String,
        lastFourDigit: json['last_four_digit'] as String,
        expiry: json['expiry'] as String,
        isDefault: json['is_default'] as bool);
  }

  static fromNetsClickJson(Map<String, dynamic> json) {
    return BankCard(
        id: json['txn_nets_click_id'],
        type: json['issuer_short_name'],
        paymentMode: 'nets_click',
        lastFourDigit: json['last_4_digits_fpan'],
        expiry: formatExpiryDate(json['mtoken_expiry_date']));
  }
}

String formatExpiryDate(String expiryDate) => '${expiryDate.substring(0, 2)}/${expiryDate.substring(2, 4)}';