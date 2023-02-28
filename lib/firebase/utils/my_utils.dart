import 'package:flutter/material.dart';

InputDecoration getInputDecoration(
    {required IconData icon, required String word, required Widget eye}) {
  return InputDecoration(
    suffixIcon: word == 'Password' || word == 'Confirm' ? eye : null,
    prefixIcon: Icon(
      icon,
      color: Colors.black54,
    ),
    hintText: word,
    labelStyle: const TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(
        width: 1,
        color: Colors.black54,
      ),
    ),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(width: 1, color: Colors.black)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(width: 1, color: Colors.black),
    ),
  );
}

