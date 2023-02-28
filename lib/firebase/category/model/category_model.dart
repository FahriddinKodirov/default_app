class CategoryModel {
  final String categoryId; 
  final String categoryName; 
  final String description; 
  final String createdAt; 

  CategoryModel({
            required this.categoryId,
            required this.categoryName,
            required this.description,
            required this.createdAt,
           });

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
       categoryId: jsonData['categoryId'] ?? '', 
       categoryName: jsonData['categoryName'] ?? '', 
       description: jsonData['description'] ?? '', 
       createdAt: jsonData['createdAt'] ?? '', 
       );
  } 

 Map<String, dynamic> toJson() => 
   {
    'categoryId':categoryId,
    'categoryName':categoryName,
    'description':description,
    'createdAt':createdAt,
  };      

}