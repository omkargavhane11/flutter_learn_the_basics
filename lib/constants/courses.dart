List<SingleCourseDetail> coursesDummyData = [
  SingleCourseDetail(
      name: "React",
      logo:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/2300px-React-icon.svg.png",
      price: 100),
  SingleCourseDetail(
      name: "Angular",
      logo:
          "https://static-00.iconduck.com/assets.00/angular-icon-1931x2048-bef1f3lm.png",
      price: 100),
  SingleCourseDetail(
      name: "Flutter",
      logo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQymUrbs2H6p32KIMGMRHdLVGRxuLrkUSgJEPbdKnnIBURsnmwezznm6gqXO8nzGm5efO0&usqp=CAU",
      price: 100),
  SingleCourseDetail(
      name: "Java",
      logo: "https://cdn-icons-png.flaticon.com/512/226/226777.png",
      price: 100),
];

class SingleCourseDetail {
  String name;
  String logo;
  num price;

  SingleCourseDetail(
      {required this.name, required this.logo, required this.price});
}
