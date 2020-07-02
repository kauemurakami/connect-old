import 'package:flutter/material.dart';

final appTheme = ThemeData(
    primaryColor: Colors.grey,
    splashColor: Colors.greenAccent,
    primaryColorBrightness: Brightness.light,
    buttonTheme: ButtonThemeData(buttonColor: Colors.green),
    sliderTheme: SliderThemeData(
    activeTrackColor: Colors.green,
    inactiveTrackColor: Colors.greenAccent,
    trackShape: RoundedRectSliderTrackShape(),
    trackHeight: 4.0,
    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
    thumbColor: Colors.green,
    overlayColor: Colors.greenAccent.withAlpha(32),
    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
    tickMarkShape: RoundSliderTickMarkShape(),
    activeTickMarkColor: Colors.greenAccent,
    inactiveTickMarkColor: Colors.greenAccent,
    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
    valueIndicatorColor: Colors.redAccent,
    valueIndicatorTextStyle: TextStyle(
      color: Colors.white,
    ),
    ));
