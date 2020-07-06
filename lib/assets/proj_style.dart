import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// package styles 
class ProjStyle {
  static Text getTextTitle(String title) => Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      );

  static Text getTextSubTitle(String subTitle) => Text(
        subTitle,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      );

  static Text getTextHeader(String headerTitle) => Text(
        headerTitle,
        style: new TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
      );
}
