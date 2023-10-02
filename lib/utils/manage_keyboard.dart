// import 'dart:js';

import 'dart:js';

import 'package:flutter/cupertino.dart';

class KeyboardUtil {
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    //is if malab h  ki yadi hamara keyboard open ho to use band kar do
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
