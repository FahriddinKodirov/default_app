import 'package:default_package/firebase/category/cubit/category_cubit.dart';
import 'package:default_package/firebase/category/model/category_model.dart';
import 'package:default_package/firebase/category/screen/admin/update_categories_screen.dart';
import 'package:default_package/utils/my_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Categories'),),
      body: StreamBuilder<List<CategoryModel>>(
        stream: BlocProvider.of<CategoryCubit>(context,listen: false).listenCategories(),
        builder:(context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            List<CategoryModel> categories = snapshot.data!;
            return ListView.builder(
              itemBuilder:(context, index) {
                CategoryModel category = categories[index];
                return ListTile(
                  title: Text(category.categoryName),
                  trailing: SizedBox(
                    width: width(context)*0.3,
                    child: Row(
                      children: [
                         IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UpdateCategoriesScreen(
                                    categoryModel: category,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<CategoryCubit>(context,
                                      listen: false)
                                  .deleteCategory(category.categoryId);
                              print("DELETING ID:${category.categoryId}");
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
            },);
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        }, 
       ),
    );
  }
}