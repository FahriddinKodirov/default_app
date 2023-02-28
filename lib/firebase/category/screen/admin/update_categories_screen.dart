import 'package:default_package/firebase/category/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UpdateCategoriesScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const UpdateCategoriesScreen({super.key, required this.categoryModel});

  @override
  State<UpdateCategoriesScreen> createState() => _UpdateCategoriesScreenState();
}

class _UpdateCategoriesScreenState extends State<UpdateCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update Categories'),),
    );
  }
}