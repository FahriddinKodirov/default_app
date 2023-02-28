class UserFields {
  static String id = "id";
  static String age = "age";
  static String name = "name";
}

class StudentModel{
  final int? id;
  final int age;
  final String name;

  StudentModel({
     this.id,
     required this.age,
     required this.name,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json){
    return StudentModel(
        id: json['id']  as int? ?? 0, 
        age: json['age']  as int? ?? 0, 
        name: json['name']  as String? ?? '', 
        );
  }

  Map<String, dynamic> toJson() => {
        UserFields.id: id,
        UserFields.age: age,
        UserFields.name: name,
      };
  
   StudentModel copyWith({
    int? id,
    int? age,
    String? name,
  }) {
    return StudentModel(
      id: id ?? this.id,
      age: age ?? this.age,
      name: name ?? this.name,
    );
  }
}