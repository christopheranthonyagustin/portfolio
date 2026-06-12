import 'package:flutter/material.dart';

class BankCardItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? subTitle2;
  final Widget image;
  final Function onTapped;

  const BankCardItem(
      {required this.title,
      this.subTitle,
      this.subTitle2,
      required this.image,
      required this.onTapped,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    image,
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          if (subTitle != null)
                            Text(subTitle!, style: const TextStyle(fontSize:16)),
                          if (subTitle2 != null)
                            Text(subTitle2!, style: const TextStyle(fontSize:16))
                        ]),
                  ],
                ),
              ],
            )),
        Row(
          children: [
            Flexible(
                flex: 1,
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    width: double.maxFinite,
                    child: TextButton(
                        // style: ButtonStyle(
                        //   overlayColor: MaterialStateColor.resolveWith(
                        //       (states) => Colors.redAccent),
                        // ),
                        onPressed: () => onTapped(),
                        child: const Text(
                          "Remove Card",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        )))),
          ],
        )
      ],
    );
  }
}
