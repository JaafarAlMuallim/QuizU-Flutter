import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Center loading() {
  return const Center(
    child: SpinKitPouringHourGlass(
      color: Colors.white,
      size: 100,
    ),
  );
}
