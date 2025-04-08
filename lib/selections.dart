import 'package:flutter/material.dart';

class Info {

  static Map<String, Offset> musclePositions = {
    'leftBicep': Offset(80, 200),
    'rightBicep': Offset(230, 200),
    'leftCalve': Offset(465, 500),
    'rightCalve': Offset(420, 500),
    'chest': Offset(150, 200),
    'abs': Offset(150, 250),
    'leftShoulder': Offset(90, 150),
    'rightShoulder': Offset(210, 150),
    'upperBack': Offset(443, 160),
    'lowerBack': Offset(443, 250),
    'leftForearm': Offset(70, 280),
    'rightForearm': Offset(240, 280), //left-right, up-down
    'leftQuad': Offset(120, 400),
    'rightQuad': Offset(180, 400),
    'leftHamstring': Offset(470, 400),
    'rightHamstring': Offset(420, 400),
    'leftTricep': Offset(370, 210),
    'rightTricep': Offset(518, 210),
  };

  static Map<String, bool> selectedMuscles = {
    for (var key in Info.musclePositions.keys) key: false,
  };

}