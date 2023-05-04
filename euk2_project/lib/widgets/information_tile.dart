import 'package:eurokey2/features/internet_access/http_communicator.dart';
import 'package:flutter/material.dart';

///A tile showing information on the left and a logo on the right.
Widget InfoTile({
  required BuildContext context, //  kontext jako parametr
  required Size screenSize,
  required String leadingText,
  required String imageFilePath,
  String launchURL = '',
  String hyperText = '',
  String trailingText = '',
}) {
  //  nový parametr pro TextStyle
  TextStyle defaultTextStyle = TextStyle(
    fontSize: 15,
    color: Theme.of(context).textTheme.bodyLarge!.color,
  );

  return InkWell(
    onTap: () {
      if (launchURL.isEmpty) return;
      openURL(url: launchURL);
    },
    child: Row(
      children: [
        Flexible(
          child: RichText(
            text: TextSpan(
              style: defaultTextStyle,
              children: [
                TextSpan(
                  text: leadingText,
                ),
                TextSpan(
                  text: hyperText,
                  style: const TextStyle(
                    color: Colors.blue, // You can choose the hyperlink color
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: trailingText,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Image.asset(
          imageFilePath,
          width: screenSize.width * 0.25,
        ),
      ],
    ),
  );
}