import 'package:flutter/material.dart';

class CategoryTabWidget extends StatelessWidget {
  const CategoryTabWidget({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: name,
    );
  }
}