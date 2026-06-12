class NETSClickPayload {
  final String consumerId;
  final String orderId;
  final String merchantId;
  String tlv;
  final double amount;
  final int netClickId;

  NETSClickPayload(
      {required this.consumerId,
      required this.orderId,
      required this.merchantId,
      required this.tlv,
      required this.amount,
      required this.netClickId});

  List<Object> get props => [];

  Map<String, dynamic> toMerchantHostJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['consumer_id'] = consumerId;
    data['consumer_order_id'] = orderId;
    data['merchant_id'] = merchantId;
    data['tlv'] = tlv;
    data['trxn_amount'] = amount;
    data['txn_nets_click_id'] = netClickId;
    print('SENDING TO MERCHANT HOST $data');
    return data;
  }

  changeTLV(String newTLV){
    print('changing TLV to: $newTLV');
    tlv = newTLV;
  }
  // static fromJson(Map<String, dynamic> json) {
  //   return NETSClickPayload(
  //       consumerId: json['consumer_id'] as int,
  //       orderId: json['type'] as String,
  //       merchantId: json['payment_mode'] as String,
  //       tlv: json['last_four_digit'] as String,
  //       amount: json['expiry'] as String,
  //       netClickId: json['is_default'] as bool);
  // }
  //
  // static fromNetsClickJson(Map<String, dynamic> json) {
  //   return BankCard(
  //       id: json['txn_nets_click_id'],
  //       type: json['issuer_short_name'],
  //       paymentMode: 'nets_click',
  //       lastFourDigit: json['last_4_digits_fpan'],
  //       expiry: formatExpiryDate(json['mtoken_expiry_date']));
  // }
}
