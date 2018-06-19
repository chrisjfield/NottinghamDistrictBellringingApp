import 'package:flutter/material.dart';

import 'UrlHelper.dart';

class ButtonHelper {
  static Column createButton(BuildContext context, String buttonText,
      IconData icon, String url, bool urlNeedsParsing) {
    Color color = Theme.of(context).primaryColor;

    String parsedUrl = urlNeedsParsing ? UrlHelper.parse(url) : url;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: color,
          ),
          onPressed: () => UrlHelper.launchURL(parsedUrl),
        ),
        Container(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
