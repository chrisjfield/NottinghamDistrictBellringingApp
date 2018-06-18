import 'package:flutter/material.dart';

class TextHelper {
  static bool isNullOrEmpty(String text) {
    return (text != null && text.isNotEmpty) ? false : true;
  }

  static Widget _textRow(String text, double textSize, FontWeight textWeight,
      double topPadding, TextAlign textAlign, int maxLines) {
    // if no text is passed in return an empty container as this takes no space
    if (isNullOrEmpty(text)) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              child: Text(
                text,
                maxLines: maxLines,
                textAlign: textAlign,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: textWeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget textRowHeading({String text, double topPadding}) {
    return _textRow(
        text, 18.0, FontWeight.bold, topPadding, TextAlign.center, 2);
  }

  static Widget textRowSubHeading({String text, double topPadding}) {
    return _textRow(
        text, 16.0, FontWeight.w300, topPadding, TextAlign.center, 2);
  }

  static Widget textRowCenteredLarge({String text, double topPadding}) {
    return _textRow(
        text, 15.0, FontWeight.normal, topPadding, TextAlign.center, 20);
  }

  static Widget textRowCentered({String text, double topPadding}) {
    return _textRow(
        text, 14.0, FontWeight.normal, topPadding, TextAlign.center, 20);
  }

  static Widget textRowLeft({String text, double topPadding}) {
    return _textRow(
        text, 14.0, FontWeight.normal, topPadding, TextAlign.start, 20);
  }
}
