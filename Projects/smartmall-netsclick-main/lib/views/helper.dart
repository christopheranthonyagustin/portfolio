import 'package:flutter/material.dart';

Future<void> startLoading(BuildContext context, String title) async {
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SimpleDialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(child:
            Column(
      crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const CircularProgressIndicator(),
              const SizedBox(height: 50),
              Text(title, style: const TextStyle(fontSize: 24, color: Colors.white))
            ],
            )))
        ],
      );
    },
  );
}

void showSimpleDialog(
    {required String title,
      required String message,
      String buttonText = 'Ok',
      required BuildContext context,
      Function? onDismissed}) {
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const Divider(height: 1),
                          const SizedBox(height:10),
                          Text(message, style: const TextStyle(fontSize: 18)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: ElevatedButton(
                                      child: Text(buttonText, style: const TextStyle(color: Colors.white, fontSize: 20)),//Theme.of(context).textTheme.titleLarge
                                      onPressed: () => //print('go to manage payment page'),
                                      Navigator.of(builderContext).pop())),

                            ],
                          )
                        ]),
                  ))
            ]));
      }).then((value) {
    if (onDismissed != null) {
      onDismissed();
    }
  });
}

void showYesNoDialog(
    {required String title,
      required String message,
      String noButtonText = 'No',
      String yesButtonText = 'Yes',
      required Function onYesTapped,
      required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext builderContext) {
        return Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Material(
                              color: Colors.transparent,
                              child: Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600))),
                          const SizedBox(height: 10),
                          const Divider(height: 1),
                          const SizedBox(height: 15),
                          Material(
                              color: Colors.transparent,
                              child: Text(message, style: const TextStyle(fontSize: 18))),
                          const SizedBox(height: 15),
                          const Divider(height: 1),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, false);
                                      },
                                      child: Text(noButtonText,
                                          style: const TextStyle(fontSize: 16)))),
                              Expanded(
                                  child: TextButton(
                                      onPressed: () => {onYesTapped()},
                                      child: Text(yesButtonText,
                                          style: const TextStyle(color: Colors.red, fontSize: 16))))
                            ],
                          )
                        ]),
                  ))
            ]));
      }).then((value) {});
}