import 'package:default_package/firebase/category/cubit/category_state.dart';
import 'package:default_package/firebase/category/model/category_model.dart';
import 'package:default_package/firebase/category/repository/category_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;

  CategoryCubit(this.categoryRepo):super(InitialCategoryState());


  addCategory(CategoryModel categoryModel) =>
         categoryRepo.addCategory(categoryModel: categoryModel);
 
  updateCategory(CategoryModel categoryModel) =>
         categoryRepo.updateCategory(categoryModel: categoryModel);
  
  deleteCategory(String docId) =>
         categoryRepo.deleteCategory(docId: docId);

  
  Stream<List<CategoryModel>> listenCategories() => categoryRepo.getCategories();

}