import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  // ! VARIABLE WITH NO VALUE SHOULD HAVE REQUIRED
  const Category(
      {required this.id, required this.title, this.color = Colors.orange});
}
