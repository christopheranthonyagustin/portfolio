import 'dart:convert';

import '../../models/nets_click_payload.dart';
import '../../models/bank_card.dart';
import 'api.dart';

class BeveatAPIService {
  BeveatAPIService();

  Future<bool> netsHealthCheck() async {
    print('netsHealthCheck');
    var response = await Api().dio.get('/common/payments/nets-click/healthcheck');
    print(response);
    return true;
    // return response.data['result']['data']['body']['response_code'] == '00';
  }

  Future<BankCard?> registerTokenNetsClick(String tlv, String orgId) async {
    // TLV must be 250 characters long.

    final Map<String, dynamic> data = <String, dynamic>{};
    data['tlv'] = tlv;
    data['org_id'] = orgId;
    print('=====registerTokenNetsClick=====\n/common/partner-merchants/payments/nets-click/register\n$data');

    var response = await Api().dio.post('/common/partner-merchants/payments/nets-click/register', data: data);
    print('response: $response');

    Map responseBody = response.data;
    if (response.data['status'] == 'success') {
      return BankCard.fromNetsClickJson(responseBody['result']['data']);
    }
    return null;
  }

  Future<String> confirmPurchaseNetsClick(NETSClickPayload payload) async {
    print('confirmPurchaseNetsClick');
    print('Consumer Id: ${payload.consumerId}');
    print('Order Id: ${payload.orderId}');
    print('Merchant Id: ${payload.merchantId}');
    print('TLV: ${payload.tlv}');
    print('Amount Paid: ${payload.amount}');
    print('NETS Click Id: ${payload.orderId}');
    print('=====confirmPurchaseNetsClick=====\n/common/partner-merchants/payments/nets-click/purchase\n'
        // '${jsonEncode(payload)}'
    );

    // TLV must be 260 characters long.
    var response = await Api().dio.post('/common/partner-merchants/payments/nets-click/purchase',
        data: jsonEncode({
          'partner_merchant_payload': {}, //TODO: pass partner merchant's payload to their api through merchant host
          'nets_click_payload': payload.toMerchantHostJson()
        }));

    Map responseBody = response.data;
    print('responseBody\n$responseBody');
    if (response.data['status'] == 'success') {
      print(responseBody['result']['data']['response_code']);

      // U9 and 55 error. This is
      if (responseBody['result']['data']['response_code'] == 'U9' ||
          responseBody['result']['data']['response_code'] == '55') {
        return responseBody['result']['data']['response_code'] +
            responseBody['result']['data']['cryptogram'];
      } else if (responseBody['result']['data']['response_code'] == '00') {
        return 'success';
      } else {
        String error = responseBody['result']['data'] ?? 'failure';

        return 'Response Error: ' + error;
      }

      // print(responseBody['result']['data']['body']['response_code']);
      // if (responseBody['result']['data']['body']['response_code'] == 'U9' ||
      //     responseBody['result']['data']['body']['response_code'] == '55') {
      //   return responseBody['result']['data']['body']['response_code'];
      // } else {
      //   return 'success';
      // }
    }

    return 'error';
  }

  // Future<String> confirmPurchaseNetsClick(int netsClickId, String merchantId, String tlv,
  //     UserOrder pendingOrder, String accountId) async {
  //   print('confirmPurchaseNetsClick $tlv');
  //   print(netsClickId);
  //   print(merchantId);
  //   print(pendingOrder.consumerOrderId);
  //   print(accountId);
  //   // TLV must be 260 characters long.
  //   var response = await Api().dio.post('/common/payments/nets-click/purchase',
  //       data: jsonEncode({
  //         'txn_nets_click_id': netsClickId,
  //         'merchant_id': merchantId,
  //         'trxn_amount': pendingOrder.total - pendingOrder.discount!,
  //         'consumer_order_id': pendingOrder.consumerOrderId,
  //         'consumer_id': accountId,
  //         'tlv': tlv
  //       }));
  //
  //   Map responseBody = response.data;
  //   if (response.data['status'] == 'success') {
  //     print(responseBody['result']['data']['response_code']);
  //
  //     // U9 and 55 error. This is
  //     if (responseBody['result']['data']['response_code'] == 'U9' ||
  //         responseBody['result']['data']['response_code'] == '55') {
  //       return responseBody['result']['data']['response_code'] +
  //           responseBody['result']['data']['cryptogram'];
  //     } else if (responseBody['result']['data']['response_code'] == '00') {
  //       return 'success';
  //     } else {
  //       String mti = responseBody['result']['data']['header']['mti'] ?? 'failure';
  //
  //       return 'Error: ' + mti;
  //     }
  //
  //     // print(responseBody['result']['data']['body']['response_code']);
  //     // if (responseBody['result']['data']['body']['response_code'] == 'U9' ||
  //     //     responseBody['result']['data']['body']['response_code'] == '55') {
  //     //   return responseBody['result']['data']['body']['response_code'];
  //     // } else {
  //     //   return 'success';
  //     // }
  //   }
  //
  //   return 'error';
  // }

}
