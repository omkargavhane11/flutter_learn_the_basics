class CoursesModel {
  final String name;
  final String logo;
  final num price;

  const CoursesModel(
      {required this.name, required this.logo, required this.price});

  static CoursesModel? toMap(Map data) {
    try {
      return CoursesModel(
        name: data['name'],
        logo: data['logo'],
        price: data['price'],
      );
    } catch (e) {
      print('[error] [getFromMap] $e');
      return null;
    }
  }
}
