import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget image;
  final Function onTapped;

  const PaymentItem(
      {required this.title,
      this.subTitle,
      required this.image,
      required this.onTapped,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTapped(),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  image,
                  const SizedBox(width: 10),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                        if (subTitle != null)
                          Text(subTitle!, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
                      ]),
                ],
              ),
              const Icon(CupertinoIcons.right_chevron)
            ],
          ),
        ));
  }
}
