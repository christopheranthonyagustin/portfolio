import 'package:flutter/services.dart';

import '../constants.dart';

const platformMethodChannel = MethodChannel(BundleId);

Future<void> initNOFService () async{
  try{
    await platformMethodChannel.invokeMethod('init');
  } catch (e){
    print ('initNOFService error: $e');
  }
}

Future<String> doRegistration(String mid,String muid) async {
  print('doRegistration in flutter');
  try {
    final String result = await platformMethodChannel.invokeMethod('registration', {'mid':mid, 'muid': muid});
    print('doRegistration in flutter' + result);
    return result;
  } on PlatformException catch (e) {
    print('doRegistration in flutter' + e.toString());
    return 'REGISTRATION FAILED: ${e.code}';
  } catch (e){
    rethrow;
  }
}

Future<String> doDeregistration() async {
  print('doDeregistration in flutter');
  // String _msg;
  try {
    final String result =
        await platformMethodChannel.invokeMethod('deregistration');
    print('doDeregistration in flutter ' + result);
    return result;
  } on PlatformException catch (e) {
    print('doDeregistration in flutter ' + e.toString());
    return e.code;
  }
}

String convertToCents(num amt) {
  return (amt * 100).toInt().toString();
}

Future<String> doDebit(num amount) async {
  print('doDebit in flutter');
  try {
    // Remember to convert to cents IMPT.
    final String result = await platformMethodChannel
        .invokeMethod('debit', {'amount': convertToCents(amount)});
    print('doDebit in flutter ' + result);
    return result;
  } on PlatformException catch (e) {
    print('doDebit in flutter ' + e.toString());
    return e.code;
  }
}

Future<String> doDebitWithPin(
    num amount, String responseCode, String cryptogram) async {
  print('doDebitWithPin in flutter');
  try {
    // Remember to convert to cents IMPT.
    final String result =
        await platformMethodChannel.invokeMethod('debitWithPin', {
      'amount': convertToCents(amount),
      'response_code': responseCode,
      'cryptogram': cryptogram
    });
    print('doDebitWithPin in flutter ' + result);
    return result;
  } on PlatformException catch (e) {
    print('doDebitWithPin in flutter ' + e.toString());
    return e.code;
  }
}

String? checkIsRegistrationErrorCode(String code) {
  // Assume length of of success must be more than 20,
  if (code.length > 20) {
    return null;
  }
  if (code == '9992') {
    return 'registration cancelled. Please try again.';
  } else if (code == '9996') {
    return 'No response from nets. Please try again.';
  } else if (code == '9980' || code == '9981') {
    return 'Initializing error. Please try again.';
  } else if (code =='9987') {
    return 'Old backup data found in phone error. Please restart app and try again';
  } else {
    print('checkIsRegistrationErrorCode $code');
    return 'Internal error. Please try again.';
  }
}
