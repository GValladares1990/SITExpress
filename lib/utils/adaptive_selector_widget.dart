import 'package:flutter/material.dart';

Widget adaptiveSelectorWidget({
  required Widget narrow,
  required Widget wide,
  required bool isNarrow,
}) {
  return isNarrow ? narrow : wide;
}
