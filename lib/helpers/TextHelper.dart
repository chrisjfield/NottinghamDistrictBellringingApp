import 'package:flutter/material.dart';

class TextHelper {
  static bool isNullOrEmpty(String text) {
    return (text != null && text.isNotEmpty) ? false : true;
  }

  static Widget multipleTextRowCenteredLarge(
      {List<String> textList,
      double topPadding,
      double leftPadding,
      double rightPadding}) {
    return _multipleTextRow(textList, 15.0, FontWeight.normal, topPadding,
        TextAlign.start, 20, leftPadding, rightPadding);
  }

  static Widget multipleTextRowLeftAlign(
      {List<String> textList,
      double topPadding,
      double leftPadding,
      double rightPadding}) {
    return _multipleTextRow(textList, 14.0, FontWeight.normal, topPadding,
        TextAlign.start, 20, leftPadding, rightPadding);
  }

  static Widget textRowCentered({String text, double topPadding}) {
    return _textRow(
        text, 14.0, FontWeight.normal, topPadding, TextAlign.center, 20);
  }

  static Widget textRowCenteredLarge({String text, double topPadding}) {
    return _textRow(
        text, 15.0, FontWeight.normal, topPadding, TextAlign.center, 20);
  }

  static Widget textRowHeading({String text, double topPadding}) {
    return _textRow(
        text, 18.0, FontWeight.bold, topPadding, TextAlign.center, 2);
  }

  static Widget textRowLeft({String text, double topPadding}) {
    return _textRow(
        text, 14.0, FontWeight.normal, topPadding, TextAlign.start, 20);
  }

  static Widget textRowLeftAlign(
      {String text, double topPadding, double leftPadding}) {
    return _textRow(text, 14.0, FontWeight.normal, topPadding, TextAlign.start,
        20, MainAxisAlignment.start, leftPadding);
  }

  static Widget textRowSubHeading({String text, double topPadding}) {
    return _textRow(
        text, 16.0, FontWeight.w300, topPadding, TextAlign.center, 2);
  }

  static Widget _multipleTextRow(
      List<String> textList,
      double textSize,
      FontWeight textWeight,
      double topPadding,
      TextAlign textAlign,
      int maxLines,
      double leftPadding,
      double rightPadding) {
    // if no text is passed in return an empty container as this takes no space
    if (textList.isEmpty) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(
          top: topPadding, left: leftPadding, right: rightPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: textList.map(
          (text) {
            return Flexible(
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
            );
          },
        ).toList(),
      ),
    );
  }

  static Widget _textRow(String text, double textSize, FontWeight textWeight,
      double topPadding, TextAlign textAlign, int maxLines,
      [MainAxisAlignment allignment = MainAxisAlignment.center,
      double leftPadding = 0.0]) {
    // if no text is passed in return an empty container as this takes no space
    if (isNullOrEmpty(text)) {
      return Container();
    }

    return Padding(
      padding: EdgeInsets.only(top: topPadding, left: leftPadding),
      child: Row(
        mainAxisAlignment: allignment,
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
}
