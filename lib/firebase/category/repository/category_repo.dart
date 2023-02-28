import 'package:default_package/firebase/category/model/category_model.dart';
import 'package:default_package/utils/my_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryRepo {
  final FirebaseFirestore _firestore;

  CategoryRepo({required FirebaseFirestore firebaseFirestore}):
         _firestore = firebaseFirestore;

// ------------------------ Create and Add Categories ------------------------------------
 
  Future<void> addCategory({required CategoryModel categoryModel}) async {
    try {
      DocumentReference newCategory =
          await _firestore.collection('categories').add(categoryModel.toJson());
          await _firestore.collection('categories').doc(newCategory.id).update(
           {'categoryId' : newCategory.id,}
          );
          MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli qo'shildi!");
    } on FirebaseException catch (error) {
       MyUtils.getMyToast(message: error.message.toString());
    }
  }

// ---------------------------- Delete Categories --------------------------------------------
 
  Future<void> deleteCategory({required String docId}) async {
    try {
      await _firestore.collection('categories').doc(docId).delete();
     MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli o'chirildi!");
    } on FirebaseException catch(error) {
      MyUtils.getMyToast(message: error.message.toString());
    }
  }

// ---------------------------- Update Categories --------------------------------------------
 
  Future<void> updateCategory({required CategoryModel categoryModel}) async {
    try {
      await _firestore
            .collection('categories')
            .doc(categoryModel.categoryId)
            .update(categoryModel.toJson());

      MyUtils.getMyToast(message: "Kategorya muvaffaqiyatli yangilandi!");
  } on FirebaseException catch(error) {
    MyUtils.getMyToast(message: error.message.toString());
  }
}
  
// ---------------------------- get Categories --------------------------------------------

Stream<List<CategoryModel>> getCategories() =>
   _firestore.collection('categories').snapshots().map((event) => event.docs.map((doc) => CategoryModel.fromJson(doc.data())).toList());

}
  
